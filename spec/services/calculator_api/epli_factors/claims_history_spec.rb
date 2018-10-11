require 'rails_helper'

RSpec.describe CalculatorApi::EpliFactors::ClaimsHistory do
  describe '#process_factor' do
    let(:company) { build(:company_info) }
    let(:sic) { company.industry_code }

    it 'returns 0.8 when company is not from CA' do
      allow(company).to receive(:hq_state).and_return('FL')
      factor = CalculatorApi::EpliFactors::ClaimsHistory.new(company, sic, nil)
      expect(factor.factor).to be(0.8)
    end

    it 'returns 1 when company is from CA' do
      allow(company).to receive(:hq_state).and_return('CA')
      factor = CalculatorApi::EpliFactors::ClaimsHistory.new(company, sic, nil)
      expect(factor.factor).to be(1)
    end
  end
end
