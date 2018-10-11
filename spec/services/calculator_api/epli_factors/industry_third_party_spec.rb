require 'rails_helper'

RSpec.describe CalculatorApi::EpliFactors::IndustryThirdParty do
  describe '#process_factor' do
    let(:low_factor) { 1.1 }
    let(:high_factor) { 1.5 }

    let(:company) { build(:company_info) }
    let(:renewal) { RenewalBusiness.new }
    let!(:guidance) { Calculator::IndustryFactor.new }
    let(:sic) { company.industry_code }

    before do
      allow(Calculator::IndustryFactor).to receive(:find_by_sic_code_epli).and_return(guidance)
    end

    it 'returns guidance when renewal factor is lower' do
      guidance.factor = high_factor
      renewal.industry = low_factor

      factor = CalculatorApi::EpliFactors::IndustryThirdParty.new(company, sic, renewal)
      expect(factor.factor).to eql(high_factor)
    end

    it 'returns guidance when renewal is nil' do
      guidance.factor = high_factor

      factor = CalculatorApi::EpliFactors::IndustryThirdParty.new(company, sic, nil)
      expect(factor.factor).to eql(high_factor)
    end

    it 'returns renewal factor when guidance is lower' do
      guidance.factor = low_factor
      renewal.industry = high_factor

      factor = CalculatorApi::EpliFactors::IndustryThirdParty.new(company, sic, renewal)
      expect(factor.factor).to eql(high_factor)
    end
  end

  describe '#ca_flag' do
    let(:company) { build(:company_info) }
    let(:sic) { company.industry_code }

    it 'returns true if hq_state is CA' do
      allow(company).to receive(:hq_state).and_return('CA')
      factor = CalculatorApi::EpliFactors::IndustryThirdParty.new(company, sic, nil)
      expect(factor.ca_flag).to be_truthy
    end

    it 'returns false if hq_state is not CA' do
      allow(company).to receive(:hq_state).and_return('FL')
      factor = CalculatorApi::EpliFactors::IndustryThirdParty.new(company, sic, nil)
      expect(factor.ca_flag).to be_falsey
    end
  end
end
