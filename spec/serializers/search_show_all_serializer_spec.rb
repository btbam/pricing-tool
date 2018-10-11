require 'rails_helper'

RSpec.describe SearchShowAllSerializer do
  let(:company) do
    Company.new(
      duns_number: Faker::Company.duns_number.tr('^0-9', '').to_i,
      name: Faker::Company.name,
      street_address: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zip_code: Faker::Address.zip_code,
      sales_volume: Faker::Number.positive(1, 4_000_000_000),
      global_employee_total: 1234.0,
      customer: 1
    )
  end
  let(:serializer) { SearchShowAllSerializer.new(company) }
  let(:sample_description) { 'This is a sample description.' }
  let(:sample_customer) { 'This is a sample customer.' }

  describe '#to_json' do
    it 'returns valid json' do
      json = serializer.to_json
      expect { JSON.parse(json) }.not_to raise_error
    end
  end

  describe '#customer' do
    it 'returns true when company is a customer' do
      expect(serializer.customer).to be_truthy
    end
  end

  describe '#global_employe_total' do
    it 'returns an integer' do
      expect(serializer.global_employee_total).to be_an(Integer)
    end
  end
end
