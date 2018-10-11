require 'support/api_helper'

RSpec.describe DatabaseFallback::PgOracle do
  describe 'fallback_if_necessary' do
    let!(:company_info) { FactoryGirl.build(:company_info) }
    let!(:company_info_result) { double 'company_info_result' }

    it 'fallback_if_necessary with a duns number already in the DB' do
      expect(CompanyInfo).to receive(:by_duns).and_return(company_info_result)
      expect(company_info_result).to receive(:limit).and_return([company_info])
      expect(DatabaseFallback::PgOracle::Record).to receive(:process_result).with(company_info)

      pg_oracle = DatabaseFallback::PgOracle.fallback_if_necessary(1)

      expect(pg_oracle.duns_number).to eq 1
      expect(pg_oracle.date).to be_nil
    end

    it 'fallback_if_necessary with a duns number already in the DB and a missing time_ago date' do
      expect(CompanyInfo).to receive(:by_duns).and_return(company_info_result)
      expect(company_info_result).to receive(:time_ago).and_return([company_info])
      allow(CompanyInfo).to receive(:new).and_return(company_info)
      allow(DatabaseFallback::PgOracle::Record).to receive(:process_result).with(company_info)
      date = DateHelper.interval_now
      company_info.as_of_date = date

      pg_oracle = DatabaseFallback::PgOracle.fallback_if_necessary(1, time_ago: DateHelper.two_years_ago)

      expect(pg_oracle.duns_number).to eq 1
      expect(pg_oracle.time_ago).to eq DateHelper.two_years_ago
      expect(pg_oracle.results.size).to eq 5
    end

    it 'fallback_if_necessary with a duns number and date already in the DB' do
      expect(CompanyInfo).to receive(:by_duns).and_return(company_info_result)
      expect(company_info_result).to receive_message_chain(:by_date, :limit).and_return([company_info])
      expect(DatabaseFallback::PgOracle::Record).to receive(:process_result).with(company_info)
      date = DateHelper.interval_now
      company_info.as_of_date = date

      pg_oracle = DatabaseFallback::PgOracle.fallback_if_necessary(1, date: date)

      expect(pg_oracle.duns_number).to eq 1
      expect(pg_oracle.date).to eq date
    end

    it 'fallback_if_necessary with a duns number not in the DB' do
      expect(CompanyInfo).to receive(:by_duns).and_return(company_info_result)
      expect(company_info_result).to receive(:limit).and_return([])
      interval_now = DateHelper.interval_now
      expect(CompanyInfo).to receive(:new).with(duns_number: 1, as_of_date: interval_now).and_return(company_info)
      expect(DatabaseFallback::PgOracle::Record).to receive(:process_result).with(company_info)

      pg_oracle = DatabaseFallback::PgOracle.fallback_if_necessary(1)

      expect(pg_oracle.duns_number).to eq 1
      expect(pg_oracle.date).to be_nil
    end
  end
end
