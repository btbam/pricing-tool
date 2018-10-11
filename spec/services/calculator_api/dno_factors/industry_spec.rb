require 'rails_helper'

RSpec.describe CalculatorApi::DnoFactors::Industry do
  describe '#process_factor' do
    let(:low_factor) { 1.1 }
    let(:high_factor) { 1.5 }

    let(:company) { build(:company_info) }
    let(:renewal) { RenewalBusiness.new }
    let!(:guidance) { Calculator::IndustryFactor.new }
    let(:sic) { company.industry_code }
    before do
      allow(Calculator::IndustryFactor).to receive(:find_by_sic_code_dno).and_return(guidance)
    end

    it 'returns guidance when renewal factor is lower' do
      guidance.factor = high_factor
      renewal.industry = low_factor

      factor = CalculatorApi::DnoFactors::Industry.new(company, sic, renewal)
      expect(factor.factor).to eql(high_factor)
    end

    it 'returns guidance when renewal is nil' do
      guidance.factor = high_factor

      factor = CalculatorApi::DnoFactors::Industry.new(company, sic, nil)
      expect(factor.factor).to eql(high_factor)
    end

    it 'returns renewal factor when guidance is lower' do
      guidance.factor = low_factor
      renewal.industry = high_factor

      factor = CalculatorApi::DnoFactors::Industry.new(company, sic, renewal)
      expect(factor.factor).to eql(high_factor)
    end
  end
end
