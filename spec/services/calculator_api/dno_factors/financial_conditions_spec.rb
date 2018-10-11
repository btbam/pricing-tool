require 'rails_helper'

RSpec.describe CalculatorApi::DnoFactors::FinancialConditions do
  describe '#process_factor' do
    it 'defaults to 1 when company and renewal are nil' do
      factor = CalculatorApi::DnoFactors::FinancialConditions.new(nil, nil, nil)
      expect(factor.factor).to be(1)
    end

    context 'non-default scenarios' do
      let(:low_factor) { 1.1 }
      let(:high_factor) { 1.5 }

      let(:company) { build(:company_info) }
      let(:renewal) { RenewalBusiness.new }
      let!(:guidance) { Calculator::FinancialFactor.new }
      let(:sic) { company.industry_code }

      before do
        allow(Calculator::FinancialFactor).to receive(:find_by_dnb_dno).and_return(guidance)
      end

      it 'returns guidance when renewal factor is lower' do
        guidance.relativity_factor = high_factor
        renewal.industry = low_factor
        factor = CalculatorApi::DnoFactors::FinancialConditions.new(company, sic, renewal)
        expect(factor.factor).to eql(high_factor)
      end

      it 'returns guidance when renewal is nil' do
        guidance.relativity_factor = high_factor

        factor = CalculatorApi::DnoFactors::FinancialConditions.new(company, sic, nil)
        expect(factor.factor).to eql(high_factor)
      end

      it 'returns renewal factor when guidance is lower' do
        guidance.relativity_factor = high_factor
        renewal.industry = high_factor

        factor = CalculatorApi::DnoFactors::FinancialConditions.new(company, sic, renewal)
        expect(factor.factor).to eql(high_factor)
      end

      it 'returns renewal when company is nil' do
        renewal.industry = high_factor

        factor = CalculatorApi::DnoFactors::FinancialConditions.new(nil, nil, renewal)
        expect(factor.factor).to eql(high_factor)
      end
    end
  end
end
