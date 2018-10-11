require 'rails_helper'

RSpec.describe DashboardSummarySerializer do
  let(:company) do
    company = CompanyInfo.new
    company.set_missing_data
    company
  end

  let(:serializer) { DashboardSummarySerializer.new(company) }

  describe '#to_json' do
    it 'returns valid json' do
      json = serializer.to_json
      expect { JSON.parse(json) }.not_to raise_error
    end
  end

  describe '#credit_score' do
    let(:credit_score) { '700.1' }
    it 'returns the credit_score as an integer' do
      allow(company).to receive(:credit_score).and_return(credit_score)
      expect(serializer.credit_score).to eql(credit_score.to_i)
    end
  end

  describe '#expiring_gwp' do
    let(:expiring_gwp) { '0' }
    it 'returns the expiring_gwp as an integer' do
      expect(serializer.expiring_gwp).to eql(expiring_gwp.to_i)
    end
  end

  describe '#industry' do
    let(:sample_description) { 'This is a sample description.' }
    it 'returns the industry_average_sic_description' do
      allow(company).to receive(:industry_average_sic_description).and_return(sample_description)
      expect(serializer.industry).to eql(sample_description)
    end
  end

  describe '#financial_stress' do
    let(:financial_stress) { 'financial stress' }
    let(:avg_financial_stress) { 'avg financial stress' }
    it 'returns a hash of the financial stress score and the industry average financial stress' do
      allow(company).to receive(:financial_stress_score).and_return(financial_stress)
      allow(company).to receive(:industry_average_avg_financial_stress).and_return(avg_financial_stress)

      expected = { company: financial_stress, average: avg_financial_stress }
      expect(serializer.financial_stress).to eql(expected)
    end
  end

  describe '#rate_needed' do
    let(:company) { 0.1 }
    let(:average) { 0.2 }
    it 'returns a hash of the company rate and the industry average rate' do
      expected = { company: company, average: average }
      expect(serializer.rate_needed).to eql(expected)
    end
  end

  describe '#revenue' do
    let(:sales_volume) { 'sales volume' }
    let(:avg_revenue) { 'avg revenue' }
    it 'returns a hash of the sales volume and the industry average revenue' do
      allow(company).to receive(:sales_volume).and_return(sales_volume)
      allow(company).to receive(:industry_average_avg_revenue).and_return(avg_revenue)

      expected = { company: sales_volume, average: avg_revenue }
      expect(serializer.revenue).to eql(expected)
    end
  end

  describe '#employees' do
    let(:global_employee_total) { 'global employee total' }
    let(:avg_employees) { 'avg employees' }
    it 'returns a hash of the global employee total and the industry average employees' do
      allow(company).to receive(:global_employee_total).and_return(global_employee_total)
      allow(company).to receive(:industry_average_avg_employees).and_return(avg_employees)

      expected = { company: global_employee_total, average: avg_employees }
      expect(serializer.employees).to eql(expected)
    end
  end

  describe '#bankruptcy' do
    let(:color) { 'red' }
    let(:text) { 'This company is bankrupt.' }
    it 'returns a hash of bankruptcy data' do
      allow(company).to receive(:bankruptcy_data)
      allow_any_instance_of(BankruptcyRating).to receive(:color).and_return(color)
      allow_any_instance_of(BankruptcyRating).to receive(:text).and_return(text)
      allow_any_instance_of(BankruptcyRating).to receive(:process_data)
      allow_any_instance_of(BankruptcyRating).to receive(:determine_rating)

      expected = { color: color, text: text }
      expect(serializer.bankruptcy).to eql(expected)
    end
  end
end
