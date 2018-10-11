require 'rails_helper'
require 'support/elastic_helper'

RSpec.describe User do
  let(:user) { create(:user) }

  describe '#reset_session' do
    it 'updates the session_token' do
      before = user.session_token
      user.reset_session
      expect(user.session_token).not_to eql(before)
      expect(user.persisted?).to be_truthy
    end
  end

  describe '#validate_session' do
    it 'validates valid session tokens' do
      session_token = user.session_token
      expect(user.validate_session(session_token)).to be_truthy
    end

    it 'does not validate invalid session tokens' do
      session_token = 'invalid session token'
      expect(user.validate_session(session_token)).to be_falsey
    end
  end
end
