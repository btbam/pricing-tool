require 'rails_helper'

RSpec.describe CalculatorApi::DnoFactors::MergersAndAcquisitions do
  let(:company_info) { double 'company_info' }
  let(:renewal_business) { double 'renewal_business' }
  let(:sic) { 79 }

  describe '#process_factor' do
    it 'uses mergers_and_acquisitions for renewal business' do
      expect(renewal_business).to receive(:mergers_and_acquisitions).and_return(2)
      merg_acqui = CalculatorApi::DnoFactors::MergersAndAcquisitions.new(company_info, sic, renewal_business)
      expect(merg_acqui.factor).to eq 2
    end

    it 'uses 1 for missing mergers_and_acquisitions for renewal business' do
      expect(renewal_business).to receive(:mergers_and_acquisitions).and_return(nil)
      merg_acqui = CalculatorApi::DnoFactors::MergersAndAcquisitions.new(company_info, sic, renewal_business)
      expect(merg_acqui.factor).to eq 1
    end

    it 'uses 1 for new business' do
      renewal_business = nil
      merg_acqui = CalculatorApi::DnoFactors::MergersAndAcquisitions.new(company_info, sic, renewal_business)
      expect(merg_acqui.factor).to eq 1
    end
  end
end
