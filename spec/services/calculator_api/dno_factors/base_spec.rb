require 'rails_helper'

RSpec.describe CalculatorApi::DnoFactors::Base do
  let(:company_info) { double 'company_info' }
  let(:renewal_business) { double 'renewal_business' }
  let(:sic) { 79 }

  it '#initializes' do
    base = CalculatorApi::DnoFactors::Base.new(company_info, sic, renewal_business)
    expect(base.factor).to eq 1
    expect(base.company).to eq company_info
    expect(base.renewal).to eq renewal_business
  end
end
