require 'rails_helper'

RSpec.describe CalculatorApi::DnoFactors::RevenueAssetIrregularities do
  describe '#process_factor' do
    it 'defaults to 1 when renewal is nil' do
      factor = CalculatorApi::DnoFactors::RevenueAssetIrregularities.new(:company, :sic, nil)
      expect(factor.factor).to eql(1)
    end

    it 'returns renewal factor when between 1 and 1.75' do
      expected = 1.25
      renewal = RenewalBusiness.new
      renewal.revenue_asset_irregularities = expected

      factor = CalculatorApi::DnoFactors::RevenueAssetIrregularities.new(:company, :sic, renewal)
      expect(factor.factor).to eql(expected)
    end

    it 'returns 1 when not between 1 and 1.75' do
      expected = 2.8
      renewal = RenewalBusiness.new
      renewal.revenue_asset_irregularities = expected

      factor = CalculatorApi::DnoFactors::RevenueAssetIrregularities.new(:company, :sic, renewal)
      expect(factor.factor).to eql(1)
    end
  end
end
