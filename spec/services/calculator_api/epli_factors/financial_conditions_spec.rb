require 'rails_helper'

RSpec.describe CalculatorApi::EpliFactors::FinancialConditions do
  describe '#process_factor' do
    it 'defaults to 1 when renewal is nil' do
      factor = CalculatorApi::EpliFactors::FinancialConditions.new(nil, nil, nil)
      expect(factor.factor).to be(1)
    end

    let(:low_factor) { 1.1 }
    let(:high_factor) { 1.5 }

    let(:company) { build(:company_info) }
    let(:renewal) { RenewalBusiness.new }
    let!(:guidance) { build(:financial_factor) }
    let(:sic) { company.industry_code }
    before do
      allow(Calculator::FinancialFactor).to receive(:find_by_dnb_epli).and_return(guidance)
    end

    it 'returns guidance when renewal factor is lower' do
      guidance.relativity_factor = high_factor
      renewal.industry = low_factor
      factor = CalculatorApi::EpliFactors::FinancialConditions.new(company, sic, renewal)
      expect(factor.factor).to eql(high_factor)
    end

    it 'returns guidance when renewal is nil' do
      guidance.relativity_factor = high_factor

      factor = CalculatorApi::EpliFactors::FinancialConditions.new(company, sic, nil)
      expect(factor.factor).to eql(high_factor)
    end

    it 'returns renewal factor when guidance is lower' do
      guidance.relativity_factor = high_factor
      renewal.industry = high_factor

      factor = CalculatorApi::EpliFactors::FinancialConditions.new(company, sic, renewal)
      expect(factor.factor).to eql(high_factor)
    end
  end
end
