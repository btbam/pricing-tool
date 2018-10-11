require 'rails_helper'

RSpec.describe CalculatorApi::EpliFactors::IncidentMgmt do
  describe '#process_factor' do
    let(:company) { build(:company_info) }
    let(:renewal) { double 'renewal_business' }
    let(:sic) { company.industry_code }

    it 'defaults to 1 when renewal is nil' do
      factor = CalculatorApi::EpliFactors::IncidentMgmt.new(company, sic, nil)
      expect(factor.factor).to be(1)
    end

    xit 'returns renewal when renewal is between 0.8 and 1.5' do
      allow(renewal).to receive(:incident_mgmt).and_return(1.1)
      factor = CalculatorApi::EpliFactors::IncidentMgmt.new(company, sic, renewal)
      expect(factor.factor).to be(1.1)
    end

    xit 'defaults to 1 when renewal is not between 0.8 and 1.5' do
      allow(renewal).to receive(:incident_mgmt).and_return(2.2)
      factor = CalculatorApi::EpliFactors::IncidentMgmt.new(company, sic, renewal)
      expect(factor.factor).to be(1)
    end
  end
end
