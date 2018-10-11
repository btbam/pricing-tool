require 'rails_helper'

RSpec.describe CalculatorApi::EpliFactors::PriorActsCoverage do
  describe '#process_factor' do
    let(:company) { build(:company_info) }
    let(:renewal) { double 'renewal_business' }
    let(:sic) { company.industry_code }

    it 'defaults to 1' do
      factor = CalculatorApi::EpliFactors::PriorActsCoverage.new(company, sic, nil)
      expect(factor.factor).to be(1)
    end
  end
end
