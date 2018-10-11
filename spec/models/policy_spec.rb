require 'rails_helper'

RSpec.describe Policy, type: :model do
  let(:business_product) { create(:business_product) }
  let(:business_type) { create(:business_type) }
  let(:ci) { create(:company_info) }
  let(:es_result) { double 'ESResult' }
  subject(:policy) do
    create(:policy,
           business_product: business_product,
           business_type: business_type,
           duns_number: rand(1..99),
           sic_code: ci.industry_code,
           policy_year: 2014)
  end

  it { is_expected.to belong_to(:business_product) }
  it { is_expected.to belong_to(:business_type) }

  it 'can be initialzed' do
    product = create(:business_product)
    type = create(:business_type)

    expect do
      Policy.new(
        policy_number: rand(100_000..999_999),
        limit: rand(15_000..30_000),
        retention: rand(10_000_000..30_000_000),
        sales: rand(1_000_000..500_000_000_000),
        gwp: rand(10_000..50_000),
        loss_severity: rand(50_000..200_000),
        tax_state_code: rand(1..50),
        tax_state_abbr: Faker::Address.state_abbr,
        sic_code: rand(0..99),
        duns_number: rand(1..99),
        business_product: product,
        business_type: type,
        policy_year: 2014
      )
    end.not_to raise_error
  end

  describe 'scopes' do
    describe 'nearest_forty' do
      it 'find the nearest 40 policies' do
        allow_any_instance_of(CompanyRepository).to receive(:find_by_duns_array).and_return([es_result])
        allow(es_result).to receive(:name).and_return('test')
        allow(es_result).to receive(:duns_number).and_return(policy.duns_number)
        expect(Policy.nearest_forty(policy.sic_00_code,
                                    policy.business_product.id,
                                    policy.sales,
                                    ci.duns_number)
                     .first).to eq(policy)
      end
    end
  end

  describe '#product' do
    it 'gets the name of the associated product' do
      expect(policy.product).to eq(business_product.name)
    end
  end

  describe '#type' do
    it 'gets the name of the associated product type' do
      expect(policy.type).to eq(business_type.name)
    end
  end

  describe '#company_info' do
    it 'returns the associated company info object' do
      expect(CompanyInfo).to receive(:create_from_es).with(duns: policy.duns_number)
      policy.company_info
    end
  end
end
