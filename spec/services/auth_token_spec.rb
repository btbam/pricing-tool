require 'rails_helper'

RSpec.describe(AuthToken) do
  let(:key) { 'chickens' }
  let(:value) { 'rabbits' }
  let(:payload) { { key => value } }
  let(:token) { 'abcdefg' }

  context 'instance methods' do
    let!(:auth_token) { AuthToken.new(payload: payload) }

    describe '#issue_token' do
      it 'returns a valid token' do
        auth_token.issue_token
        expect(auth_token.valid?).to be_truthy
      end

      it 'expires' do
        allow(auth_token).to receive(:expiration).and_return(10.days.ago.to_i)
        auth_token.issue_token
        expect(auth_token.valid?).to be_falsey
      end
    end

    describe '#valid?' do
      before do
        auth_token.issue_token
      end

      it 'returns the decoded token' do
        token = auth_token.valid?
        expect(token).to be_an(Array)
        expect(token.first).to include(payload.stringify_keys)
      end

      it 'returns false when the secret is wrong' do
        allow(auth_token).to receive(:secret).and_return('invalid secret')
        expect(auth_token.valid?).to be_falsey
      end
    end
  end

  context 'class methods' do
    describe '.issue_token' do
      it 'calls the issue_token instance method' do
        allow_any_instance_of(AuthToken).to receive(:issue_token)
        expect_any_instance_of(AuthToken).to receive(:issue_token).once
        AuthToken.issue_token(payload)
      end
    end

    describe '.valid?' do
      it 'calls the valid? instance method' do
        allow_any_instance_of(AuthToken).to receive(:issue_token)
        expect_any_instance_of(AuthToken).to receive(:valid?).once
        AuthToken.valid?(token)
      end
    end
  end
end
