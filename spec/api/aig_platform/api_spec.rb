require 'support/api_helper'

RSpec.describe Platform::API do
  describe 'GET /api' do
    context 'when logged out' do
      it 'returns an empty JSON object' do
        get '/api'
        expect(last_response.status).to eql(200)
        expect(JSON.parse(last_response.body)).to eql({})
      end
    end

    context 'when logged in' do
      include_context 'logged in with privileges'

      it 'returns the current_user JSON object' do
        get '/api'
        expect(last_response.status).to eql(200)
        response = JSON.parse(last_response.body)
        expect(response).not_to be_empty
        expect(response).to eql(JSON.parse(valid_user.to_json))
      end
    end
  end
end
