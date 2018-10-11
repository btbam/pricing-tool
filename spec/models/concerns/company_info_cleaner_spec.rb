require 'rails_helper'

RSpec.describe CompanyInfoCleaner do
  let(:company_info_cleaner_test) do
    class CompanyInfoCleanerTest
      include CompanyInfoCleaner
      # These attrs are on the CompanyInfo class.
      # They cannot be declaired on the Concern because they.
      #   override default rails functionality on the Model
      attr_accessor :hq_state, :start_year, :state, :tree_pos, :duns_number, :global_employee_total,
                    :local_employee_total
      def industry_code; end
    end
    CompanyInfoCleanerTest.new
  end

  describe '#sic_first' do
    it 'returns nil if value is empty' do
      allow(company_info_cleaner_test).to receive(:industry_code).and_return('')
      expect(company_info_cleaner_test.sic_first).to be_nil
    end

    it 'returns value[0] if size is 3' do
      allow(company_info_cleaner_test).to receive(:industry_code).and_return('foo')
      expect(company_info_cleaner_test.sic_first).to eql('f')
    end

    it 'returns value[0..1] if size is not 3' do
      allow(company_info_cleaner_test).to receive(:industry_code).and_return('xyzzy')
      expect(company_info_cleaner_test.sic_first).to eql('xy')
    end
  end

  describe '#hq_state_from_state' do
    it 'returns state if hq_state is blank and tree_pos is 1' do
      allow(company_info_cleaner_test).to receive(:hq_state).and_return(' ')
      allow(company_info_cleaner_test).to receive(:state).and_return('state')
      allow(company_info_cleaner_test).to receive(:tree_pos).and_return(1)
      expect(company_info_cleaner_test.hq_state_from_state).to eql('state')
    end

    it 'returns state if hq_state is blank and tree_pos is 4' do
      allow(company_info_cleaner_test).to receive(:hq_state).and_return(' ')
      allow(company_info_cleaner_test).to receive(:state).and_return('state')
      allow(company_info_cleaner_test).to receive(:tree_pos).and_return(4)
      expect(company_info_cleaner_test.hq_state_from_state).to eql('state')
    end

    it 'returns hq_state if hq_state is not blank and tree_pos is 1' do
      allow(company_info_cleaner_test).to receive(:hq_state).and_return('hq_state')
      allow(company_info_cleaner_test).to receive(:state).and_return('state')
      allow(company_info_cleaner_test).to receive(:tree_pos).and_return(1)
      expect(company_info_cleaner_test.hq_state_from_state).to eql('hq_state')
    end

    it 'returns hq_state if hq_state is blank and tree_pos is not 1' do
      allow(company_info_cleaner_test).to receive(:hq_state).and_return('hq_state')
      allow(company_info_cleaner_test).to receive(:state).and_return('state')
      allow(company_info_cleaner_test).to receive(:tree_pos).and_return(2)
      expect(company_info_cleaner_test.hq_state_from_state).to eql('hq_state')
    end
  end

  describe '#set_fake_data' do
    it 'sets fake data' do
      company_info_cleaner_test.set_fake_data
      expect(company_info_cleaner_test.description).not_to be_nil
      expect(company_info_cleaner_test.url).not_to be_nil
      expect(company_info_cleaner_test.industry).not_to be_nil
      expect(company_info_cleaner_test.address).not_to be_nil
    end
  end

  describe '#set_real_data' do
    let!(:glassdoor_double) { instance_double(ApiParser::Glassdoor) }

    before do
      allow(ApiParser::Glassdoor).to receive(:new).and_return(glassdoor_double)
      allow(glassdoor_double).to receive(:set_company_data)
      allow(glassdoor_double).to receive(:glassdoor_url).and_return('http://www.example.com')
      allow(glassdoor_double).to receive(:meta_data)
      allow(glassdoor_double).to receive(:query_url)
      allow(glassdoor_double).to receive(:meta_url=)
    end

    it 'sets real data' do
      allow(company_info_cleaner_test).to receive(:years_since_start).and_return(10)
      company_info_cleaner_test.set_real_data
      expect(company_info_cleaner_test.hq_state).not_to be_nil
      expect(company_info_cleaner_test.start_year).not_to be_nil
      expect(company_info_cleaner_test.url).not_to be_nil
      expect(company_info_cleaner_test.description).not_to be_nil
    end
  end

  describe '#description_from_meta_data' do
    let(:sample_description) { 'This is a sample description.' }
    let(:meta_data) do
      class MetaData
        attr_accessor :meta, :description
      end
      MetaData.new
    end

    it 'returns the description field' do
      meta_data.description = sample_description
      meta_data.meta = nil
      expect(company_info_cleaner_test.description_from_meta_data(meta_data)).to eql(sample_description)
    end

    it 'returns the og:description field' do
      meta_data.description = nil
      meta_data.meta = { 'og:description' => sample_description }
      expect(company_info_cleaner_test.description_from_meta_data(meta_data)).to eql(sample_description)
    end

    it 'returns the twitter:description field' do
      meta_data.description = nil
      meta_data.meta = { 'twitter:description' => sample_description }
      expect(company_info_cleaner_test.description_from_meta_data(meta_data)).to eql(sample_description)
    end

    it 'returns a missing description if no meta_data' do
      allow(company_info_cleaner_test).to receive(:missing_description).and_return(sample_description)
      expect(company_info_cleaner_test.description_from_meta_data(nil)).to eql(sample_description)
    end
  end

  describe '#set_missing_data' do
    it 'sets missing data' do
      company_info_cleaner_test.set_missing_data
      expect(company_info_cleaner_test.description).not_to be_nil
    end
  end

  describe '#missing_description' do
    it 'returns something vaguely string-like' do
      expect(company_info_cleaner_test.missing_description).to respond_to(:to_s)
    end
  end

  describe '#years_since_start' do
    it 'returns years since the start' do
      company_info_cleaner_test.start_year = 2.years.ago.year
      expect(company_info_cleaner_test.send(:years_since_start)).to eql(2)
    end

    it 'returns nil if no start_year' do
      company_info_cleaner_test.start_year = nil
      expect(company_info_cleaner_test.send(:years_since_start)).to eql(nil)
    end
  end

  describe '#dno_renewal' do
    before do
      expect(company_info_cleaner_test).to receive(:duns_number).and_return(1)
    end

    it 'returns true if a dno_renewal is found' do
      expect(RenewalBusiness).to receive(:find_by_duns_dno).and_return(1)
      expect(company_info_cleaner_test.send(:dno_renewal)).to be_truthy
    end

    it 'returns false if a dno_renewal is not found' do
      expect(RenewalBusiness).to receive(:find_by_duns_dno).and_return(nil)
      expect(company_info_cleaner_test.send(:dno_renewal)).to be_falsy
    end
  end

  describe '#epli_renewal' do
    before do
      expect(company_info_cleaner_test).to receive(:duns_number).and_return(1)
    end

    it 'returns true if a epli_renewal is found' do
      expect(RenewalBusiness).to receive(:find_by_duns_epli).and_return(1)
      expect(company_info_cleaner_test.send(:epli_renewal)).to be_truthy
    end

    it 'returns false if a epli_renewal is not found' do
      expect(RenewalBusiness).to receive(:find_by_duns_epli).and_return(nil)
      expect(company_info_cleaner_test.send(:epli_renewal)).to be_falsy
    end
  end

  describe '#financial_institution?' do
    it 'returns true if a sic_first is between 60 and 67' do
      expect(company_info_cleaner_test).to receive(:sic_first).and_return('60')
      expect(company_info_cleaner_test.send(:financial_institution?)).to be true

      expect(company_info_cleaner_test).to receive(:sic_first).and_return('67')
      expect(company_info_cleaner_test.send(:financial_institution?)).to be true
    end

    it 'returns false if a sic_first is not between 60 and 67' do
      expect(company_info_cleaner_test).to receive(:sic_first).and_return('59')
      expect(company_info_cleaner_test.send(:financial_institution?)).to be false

      expect(company_info_cleaner_test).to receive(:sic_first).and_return('68')
      expect(company_info_cleaner_test.send(:financial_institution?)).to be false
    end
  end

  describe '#employee_total' do
    it 'returns global_employee_total if it is present' do
      expect(company_info_cleaner_test).to receive(:global_employee_total).and_return(1)
      expect(company_info_cleaner_test.send(:employee_total)).to eq(1)
    end

    it 'returns local_employee_total if global_employee_total is not present' do
      expect(company_info_cleaner_test).to receive(:global_employee_total).and_return(nil)
      expect(company_info_cleaner_test).to receive(:local_employee_total).and_return(2)
      expect(company_info_cleaner_test.send(:employee_total)).to eq(2)
    end
  end

  describe 'private methods' do
    describe '#generate_hq_state' do
      let(:sample_state) { 'Florida' }

      it 'returns hq_state' do
        company_info_cleaner_test.hq_state = sample_state
        expect(company_info_cleaner_test.send(:generate_hq_state)).to eql(sample_state)
      end

      context 'when hq_state is nil' do
        it 'generates state' do
          local_sample = sample_state
          company_info_cleaner_test.hq_state = nil
          company_info_cleaner_test.define_singleton_method(:generate_state) { local_sample }
          expect(company_info_cleaner_test.send(:generate_hq_state)).to eql(sample_state)
        end

        it 'handles generate_state method missing ' do
          company_info_cleaner_test.hq_state = nil
          expect { company_info_cleaner_test.send(:generate_hq_state) }.not_to raise_error
        end

        it 'returns N/A' do
          expect(company_info_cleaner_test.send(:generate_hq_state)).to eql('N/A')
        end
      end
    end
  end
end
