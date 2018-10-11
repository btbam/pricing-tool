require 'rails_helper'

# TODO: this module's methods are similar to the CompanyInfo class
RSpec.describe OracleHelper do
  describe 'scopes' do
    let(:oracle_helper_test) do
      class OracleHelperTest
        include OracleHelperCleaner
      end
      OracleHelperTest.new
    end

    describe '.by_duns' do
      it 'matches duns_number properly'
      it 'orders by date descending'
    end

    describe '.by_date' do
      it 'matches as_of_dt'
    end

    describe '.time_ago' do
      it 'matches all as_of_dt since specified time ago'
    end
  end

  describe '#bankruptcy_data' do
    it 'returns all info for this duns_number since two years ago'
    it 'sorts by as_of_dt in descending order'
    it 'does not return info for this duns_number since before two years ago'
  end
end
