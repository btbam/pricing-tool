require 'rails_helper'

RSpec.describe CalculatorApi do
  let(:company_info) { build(:company_info) }
  let(:renewal) { build(:renewal_business) }
  let(:sic) { company_info.industry_code }
  let(:user_history) { nil }
  it 'initializes' do
    expect(company_info).to receive(:dno_renewal).and_return(renewal)
    expect(company_info).to receive(:epli_renewal).and_return(renewal)
    expect(company_info).to receive(:financial_institution?).and_return('financial_institution')
    expect(company_info).to receive(:years_since_start).and_return('years_since_start')
    expect(CalculatorApi::DnoFactors).to receive(:new).with(company_info, sic, renewal).and_return('dno_factors')
    expect(CalculatorApi::EpliFactors).to receive(:new).with(company_info, sic, renewal).and_return('epli_factors')

    calculator_api = CalculatorApi.new(company_info, sic, user_history)

    expect(calculator_api.dno_renewal).to eq renewal
    expect(calculator_api.epli_renewal).to eq renewal
    expect(calculator_api.financial_institution).to eq 'financial_institution'
    expect(calculator_api.assets).to eq ''
    expect(calculator_api.years_in_operation).to eq 'years_since_start'
    expect(calculator_api.retention).to eq renewal.retention
    expect(calculator_api.limit).to eq renewal.limit
    expect(calculator_api.dno_factors).to eq 'dno_factors'
    expect(calculator_api.epli_factors).to eq 'epli_factors'
  end
end
