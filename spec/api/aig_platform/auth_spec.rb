require 'support/api_helper'

RSpec.describe Platform::Auth do
  let(:user) { create(:user) }

  describe 'sessions' do
    let(:valid_params) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    let(:invalid_params) do
      {
        user: {
          email: 'invalid@example.com',
          password: 'badpassword'
        }
      }
    end

    describe 'POST /api/session' do
      it 'returns a valid jwt for valid params' do
        post '/api/session', valid_params
        expect(last_response.status).to eql(201)
        json = JSON.parse(last_response.body)
        expect(json).to have_key('token')
        token = AuthToken.valid?(json['token'])
        expect(token).to be_an(Array)
        expect(token).not_to be_empty
      end

      it 'returns 401 for invalid params' do
        post '/api/session', invalid_params
        expect(last_response.status).to eql(401)
      end
    end

    describe 'DELETE /api/session' do
      context 'when logged in' do
        include_context 'logged in with privileges'

        it 'resets the user session' do
          before = valid_user.session_token
          expect(before).not_to be_empty

          delete '/api/session'
          expect(last_response.status).to eql(204)
          expect(last_response.body).to be_empty
          expect(valid_user.session_token).not_to be_empty
          expect(valid_user.session_token).not_to eql(before)
        end
      end

      it 'returns 401 when not logged in' do
        delete '/api/session'
        expect(last_response.status).to eql(401)
      end
    end
  end

  describe 'POST /api/user' do
    context 'params are valid' do
      before do
        user = build(:user)
        expect(User.where(email: user.email)).to be_empty
        post '/api/user', user: {
          email: user.email,
          password: user.password,
          password_confirmation: user.password
        }
        expect(last_response.status).to eql(201)
      end

      after do
        expect(User.where(email: user.email)).not_to be_empty
      end

      it 'creates the user' do
        json = JSON.parse(last_response.body)
        expect(json).to be_a(Hash)
        expect(json.keys).to include('email', 'token')
      end

      it 'returns a valid JWT' do
        json = JSON.parse(last_response.body)
        token = AuthToken.valid?(json['token'])
        expect(token).to be_truthy
      end
    end

    it 'returns 400 for invalid params' do
      post '/api/user', user: {
        email: 'invalid@example.com',
        password: 'some password',
        password_confirmation: 'invalid confirmation'
      }
      expect(last_response.status).to eql(400)
    end
  end

  describe 'password reset' do
    let(:token) do
      user.send(:set_reset_password_token)
    end

    let(:valid_params) do
      {
        reset_password_token: token,
        password: 'password',
        password_confirmation: 'password'
      }
    end

    describe 'POST /api/user/password' do
      context 'missing params' do
        it 'returns 400 when missing password param' do
          params = valid_params
          params.delete(:password)
          post '/api/user/password', params
          expect(last_response.status).to eql(400)
        end

        it 'returns 400 when missing password_confirmation param' do
          params = valid_params
          params.delete(:password_confirmation)
          post '/api/user/password', params
          expect(last_response.status).to eql(400)
        end

        it 'returns 400 when password_confirmation does not match password param' do
          params = valid_params
          params[:password_confirmation] = 'invalid password'
          post '/api/user/password', params
          expect(last_response.status).to eql(400)
        end

        it 'returns 400 when missing the reset_password_token param' do
          params = valid_params
          params.delete(:reset_password_token)
          post '/api/user/password', params
          expect(last_response.status).to eql(400)
        end

        it 'returns 400 when the reset_password_token is invalid' do
          params = valid_params
          params[:reset_password_token] = 'invalid token'
          post '/api/user/password', params
          expect(last_response.status).to eql(400)
        end
      end

      it 'resets the password and returns the user' do
        post '/api/user/password', valid_params
        expect(last_response.status).to eql(201)
        json = JSON.parse(last_response.body)
        expect(json['email']).to eql(user.email)
      end
    end

    describe 'POST /api/user/password/reset_token' do
      it 'returns 400 when missing user[email] param' do
        post '/api/user/password/reset_token'
        expect(last_response.status).to eql(400)
      end

      it 'returns a reset_password_token in development' do
        allow(Rails.env).to receive(:development?).and_return(true)
        post '/api/user/password/reset_token', user: { email: user.email }
        expect(last_response.status).to eql(201)
        json = JSON.parse(last_response.body)
        expect(json['reset_password_token']).not_to be_empty
      end

      it 'returns a 200 and an empty hash not in development' do
        allow(Rails.env).to receive(:development?).and_return(false)
        post '/api/user/password/reset_token', user: { email: user.email }
        expect(last_response.status).to eql(200)
        json = JSON.parse(last_response.body)
        expect(json).to be_empty
      end
    end
  end
end
