require 'rails_helper'

RSpec.describe CalculatorApi::DnoFactors do
  let(:company_info) { build(:company_info) }
  let(:renewal_business) { nil }
  let(:sic) { company_info.industry_code }
  let(:factors) { CalculatorApi::DnoFactors.new(company_info, sic, renewal_business) }

  describe 'initializes' do
    it '#claim_history' do
      expect(factors.claims_history.class).to eq CalculatorApi::DnoFactors::ClaimsHistory
      expect(factors.claims_history.frequency).to eq 1
      expect(factors.claims_history.severity).to eq 1
    end

    it '#financial_conditions' do
      expect(factors.financial_conditions.class).to eq CalculatorApi::DnoFactors::FinancialConditions
      expect(factors.financial_conditions.factor).to eq 1
    end

    it '#industry' do
      expect(factors.industry.class).to eq CalculatorApi::DnoFactors::Industry
      expect(factors.industry.factor).to eq 1.44
    end

    it '#mergers_and_acquisitions' do
      expect(factors.mergers_and_acquisitions.class).to eq CalculatorApi::DnoFactors::MergersAndAcquisitions
      expect(factors.mergers_and_acquisitions.factor).to eq 1
    end

    it '#management_experience_qualifications' do
      expect(factors.management_experience_qualifications.class)
        .to eq CalculatorApi::DnoFactors::ManagementExperienceQualifications

      expect(factors.management_experience_qualifications.factor).to eq 1
    end

    it '#entity_nonentity_coverage' do
      expect(factors.entity_nonentity_coverage.class).to eq CalculatorApi::DnoFactors::EntityNonentityCoverage
      expect(factors.entity_nonentity_coverage.factor).to eq 1
    end

    it '#revenue_asset_irregularities' do
      expect(factors.revenue_asset_irregularities.class).to eq CalculatorApi::DnoFactors::RevenueAssetIrregularities
      expect(factors.revenue_asset_irregularities.factor).to eq 1
    end

    it '#specialty_coverage' do
      expect(factors.specialty_coverage.class).to eq CalculatorApi::DnoFactors::SpecialtyCoverage
      expect(factors.specialty_coverage.punitive_damages).to eq 1
      expect(factors.specialty_coverage.prior_acts).to eq 1
    end

    it '#private_company' do
      expect(factors.private_company.class).to eq CalculatorApi::DnoFactors::PrivateCompany
      expect(factors.private_company.dno_percent_private_stock).to eq 1
      expect(factors.private_company.esop_ownership).to eq 1
      expect(factors.private_company.ipo).to eq 1
      expect(factors.private_company.private_placement).to eq 1
      expect(factors.private_company.nonentity_epli).to eq 1
      expect(factors.private_company.board_auditor).to eq 1
      expect(factors.private_company.public_debt).to eq 1
    end

    it '#litigation' do
      expect(factors.litigation.class).to eq CalculatorApi::DnoFactors::Litigation
      expect(factors.litigation.litigation_ex_dno).to eq 1
      expect(factors.litigation.litigation).to eq 1
    end
  end
end
