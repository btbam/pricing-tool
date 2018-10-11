require 'rails_helper'

RSpec.describe CalculatorApi::DnoFactors::Industry do
  describe '#initialize' do
    it 'defaults to 1 when renewal is nil' do
      claims_history = CalculatorApi::DnoFactors::ClaimsHistory.new(nil, nil, nil)
      frequency = claims_history.frequency
      severity = claims_history.severity
      expect(frequency).to be(1)
      expect(severity).to be(1)
    end

    context 'non-default scenarios' do
      let(:test_value) { 1.5 }

      let(:company) { build(:company_info) }
      let(:renewal) { RenewalBusiness.new }
      let(:sic) { company.industry_code }

      it 'returns a claim frequency and severity value other than 1 when renewal is not nil' do
        renewal.claims_frequency_last_year = test_value
        renewal.claims_severity_last_year = test_value

        claims_history = CalculatorApi::DnoFactors::ClaimsHistory.new(company, sic, renewal)
        frequency = claims_history.frequency
        severity = claims_history.severity
        expect(frequency).to eql(test_value)
        expect(severity).to eql(test_value)
      end
    end
  end
end
