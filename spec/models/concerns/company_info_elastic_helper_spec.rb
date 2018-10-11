require 'rails_helper'
require 'support/elastic_helper'

RSpec.describe CompanyInfoElasticHelper, elasticsearch: true do
  let(:test_company) { create(:company_info, duns_number: company_data.sample[:index][:data][:duns_number]) }

  describe CompanyInfoElasticHelper::ClassMethods do
    describe '.create_from_es' do
      it 'returns nil if duns is not found and row is not provided' do
        expect(CompanyInfo.create_from_es(duns: -1)).to be_nil
      end

      it 'returns the pg_c of the provided row if duns is nil' do
        expected = create(:company_info)
        provided_row = Company.new(name: 'MyTestCompany',
                                   duns_number: expected.duns_number,
                                   street_address: expected.street_address,
                                   city: expected.city,
                                   state: expected.state,
                                   zip_code: expected.zip_code,
                                   tree_pos: expected.tree_pos,
                                   sic_code: '123',
                                   sales_volume: 1_000_000_000.00,
                                   global_employee_total: 50)

        actual = CompanyInfo.create_from_es(duns: nil, row: provided_row)
        expect(actual).to be_a(CompanyInfo)
        expect(actual.name).to eql(provided_row.name)
      end

      it 'returns the pg_c of the elasticsearch row for the given duns' do
        actual = CompanyInfo.create_from_es(duns: test_company.duns_number)
        expect(actual).to be_a(CompanyInfo)
      end
    end

    describe '.pg_c_from_es_row' do
      it 'returns the pg_c for the given row' do
        provided_row = Company.new(name: test_company.name,
                                   duns_number: test_company.duns_number,
                                   street_address: test_company.street_address,
                                   city: test_company.city,
                                   state: test_company.state,
                                   zip_code: test_company.zip_code,
                                   tree_pos: test_company.tree_pos,
                                   sic_code: '123',
                                   sales_volume: 1_000_000_000.00,
                                   global_employee_total: 50)

        actual = CompanyInfo.pg_c_from_es_row(provided_row)
        expect(actual).to be_a(CompanyInfo)
      end
    end

    describe '.attributes_from_es_row' do
      it 'returns a hash of attributes from an elasticsearch row' do
        es_row = Company.new(company_data.sample[:index][:data])
        actual = CompanyInfo.attributes_from_es_row(es_row)
        expect(actual).to be_a(Hash)
        expect(actual.keys).to match_array([
          :name,
          :duns_number,
          :street_address,
          :city,
          :state,
          :tree_pos,
          :zip_code,
          :industry_code,
          :address,
          :sales_volume,
          :global_employee_total
        ])
      end
    end

    describe '.generate_address' do
      it 'calls generate_address on a new instance' do
        allow_any_instance_of(CompanyInfo).to receive(:generate_address)
        expect_any_instance_of(CompanyInfo).to receive(:generate_address)
        CompanyInfo.generate_address
      end
    end

    describe '.generate_state' do
      it 'calls generate_state on a new instance' do
        allow_any_instance_of(CompanyInfo).to receive(:generate_state)
        expect_any_instance_of(CompanyInfo).to receive(:generate_state)
        CompanyInfo.generate_state
      end
    end
  end

  context 'instance methods' do
    describe '#generate_address' do
      it 'returns an address if the data is available' do
        address = test_company.generate_address(row: test_company)
        expect(address).to be_a(String)
        expect(address).not_to be_empty
        expect(address.strip).not_to eql(',')
      end
    end

    describe '#generate_state' do
      it 'returns the state if the data is available' do
        state = test_company.generate_state(row: test_company)
        expect(state).to be_a(String)
        expect(state).not_to be_empty
        expect(state).to eql(test_company.state)
      end
    end

    describe 'private methods' do
      describe '#find_or_pass_row' do
        it 'returns the row' do
          row = test_company.send(:find_or_pass_row, test_company)
          expect(row).to eql(test_company)
        end

        it 'returns the Company record if row is nil' do
          row = test_company.send(:find_or_pass_row, nil)
          expect(row.duns_number).to eql(test_company.duns_number)
        end
      end
    end
  end
end
