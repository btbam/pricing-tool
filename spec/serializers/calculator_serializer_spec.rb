require 'rails_helper'

RSpec.describe CalculatorSerializer do
  let!(:company) { build(:company_info) }
  let!(:renewal) { build(:renewal_business) }
  let(:user_history) { nil }
  let(:sic) { company.industry_code }
  let(:serializer) { CalculatorSerializer.new(CalculatorApi.new(company, sic, user_history)) }

  before do
    allow(company).to receive(:dno_renewal).and_return(renewal)
    allow(company).to receive(:epli_renewal).and_return(renewal)
  end

  describe '#to_json' do
    it 'returns valid json' do
      json = serializer.to_json
      expect { JSON.parse(json) }.not_to raise_error
    end
  end

  describe '#financial_institution' do
    let(:financial_institution) { 'financial_institution' }
    it 'returns the financial_institution' do
      allow(company).to receive(:financial_institution?).and_return(financial_institution)
      expect(serializer.financial_institution).to eql(financial_institution)
    end
  end

  describe '#assets' do
    let(:assets) { 'assets' }
    it 'returns the assets' do
      expect(serializer.assets).to eql('')
    end
  end

  describe '#retention' do
    it 'returns the retention' do
      expect(serializer.retention).to eql(renewal.retention)
    end
  end

  describe '#limit' do
    it 'returns the limit' do
      expect(serializer.limit).to eql(renewal.limit)
    end
  end
end
