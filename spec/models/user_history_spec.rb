require 'rails_helper'

RSpec.describe UserHistory, type: :model do
  let!(:history) { create(:user_history, duns_number: 123, user_id: 1) }
  let!(:other_history) { create(:user_history, duns_number: 123, user_id: 2) }
  let!(:another_history) { create(:user_history, duns_number: 456, user_id: 1) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:company_info) }

  it { should validate_uniqueness_of(:user_id).scoped_to(:duns_number) }

  describe 'scopes' do
    describe '.by_duns' do
      it 'matches duns_number properly' do
        by_duns = UserHistory.by_duns(history.duns_number)
        expect(by_duns).to include(history)
        expect(by_duns).to include(other_history)
        expect(by_duns).not_to include(another_history)
      end
    end

    describe '.by_user' do
      it 'matches user properly' do
        by_duns = UserHistory.by_user(history.user_id)
        expect(by_duns).to include(history)
        expect(by_duns).to include(another_history)
        expect(by_duns).not_to include(other_history)
      end
    end
  end

  describe 'class methods' do
    describe '.find_by_user_and_duns' do
      it 'matches user properly' do
        result = UserHistory.find_by_user_and_duns(1, 123)
        expect(result).to eq history
      end
    end
  end
end
