require 'rails_helper'
RSpec.describe DnoCalculatorFactorsSerializer do
  let!(:company) { build(:company_info) }
  let(:sic) { company.industry_code }
  let(:user_history) { nil }
  let(:serializer) { DnoCalculatorFactorsSerializer.new(CalculatorApi.new(company, sic, user_history).dno_factors) }

  describe '#to_json' do
    it 'returns valid json' do
      json = JSON.parse(serializer.to_json)
      expect(json['claims_history']['frequency']).to_not be_nil
      expect(json['claims_history']['severity']).to_not be_nil
      expect(json['financial_conditions']).to_not be_nil
      expect(json['industry']).to_not be_nil
      expect(json['litigation']['litigation_ex_dno']).to_not be_nil
      expect(json['litigation']['litigation']).to_not be_nil
      expect(json['mergers_and_acquisitions']).to_not be_nil
      expect(json['management_experience_qualifications']).to_not be_nil
      expect(json['entity_nonentity_coverage']).to_not be_nil
      expect(json['revenue_asset_irregularities']).to_not be_nil
      expect(json['specialty_coverage']['punitive_damages']).to_not be_nil
      expect(json['specialty_coverage']['prior_acts']).to_not be_nil
      expect(json['private_company']['dno_percent_private_stock']).to_not be_nil
      expect(json['private_company']['esop_ownership']).to_not be_nil
      expect(json['private_company']['ipo']).to_not be_nil
      expect(json['private_company']['private_placement']).to_not be_nil
      expect(json['private_company']['nonentity_epli']).to_not be_nil
      expect(json['private_company']['board_auditor']).to_not be_nil
      expect(json['private_company']['public_debt']).to_not be_nil
    end
  end
end
