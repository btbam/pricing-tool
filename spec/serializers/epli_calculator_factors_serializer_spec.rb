require 'rails_helper'
RSpec.describe EpliCalculatorFactorsSerializer do
  let!(:company) { build(:company_info) }
  let(:sic) { company.industry_code }
  let(:user_history) { nil }
  let(:serializer) { EpliCalculatorFactorsSerializer.new(CalculatorApi.new(company, sic, user_history).epli_factors) }

  describe '#to_json' do
    it 'returns valid json' do
      json = JSON.parse(serializer.to_json)
      expect(json['human_resources_and_loss_prevention']).to_not be_nil
      expect(json['workforce_mgmt']).to_not be_nil
      expect(json['incident_mgmt']).to_not be_nil
      expect(json['financial_conditions']).to_not be_nil
      expect(json['claims_reporting_procedures']).to_not be_nil
      expect(json['claims_history']).to_not be_nil
      expect(json['industry_third_party']).to_not be_nil
      expect(json['prior_acts_coverage']).to_not be_nil
      expect(json['punitive_damage']).to_not be_nil
      expect(json['global_employee_total']).to_not be_nil
    end
  end
end
