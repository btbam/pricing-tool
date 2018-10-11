require 'rails_helper'

RSpec.describe CalculatorApi::DnoFactors::EntityNonentityCoverage do
  describe '#process_factor' do
    let(:company) { build(:company_info) }
    let(:sic) { company.industry_code }

    it 'defaults to 1 when renewal is nil' do
      factor = CalculatorApi::DnoFactors::EntityNonentityCoverage.new(:company, :sic, nil)
      expect(factor.factor).to be(1)
    end

    it 'returns renewal factor when between 0.8 and 1' do
      expected = 0.94
      renewal = RenewalBusiness.new
      renewal.entity_nonentity_coverage = expected

      factor = CalculatorApi::DnoFactors::EntityNonentityCoverage.new(:company, :sic, renewal)
      expect(factor.factor).to eql(expected)
    end

    it 'returns 1 when not between 0.8 and 1' do
      renewal = RenewalBusiness.new
      renewal.entity_nonentity_coverage = 2.78

      factor = CalculatorApi::DnoFactors::EntityNonentityCoverage.new(:company, :sic, renewal)
      expect(factor.factor).to eql(1)
    end
  end
end
