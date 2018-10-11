class CalculatorApi::DnoFactors
  include ActiveModel::Serialization

  attr_accessor :claims_history, :financial_conditions, :industry, :litigation, :renewal,
                :mergers_and_acquisitions, :management_experience_qualifications, :entity_nonentity_coverage,
                :revenue_asset_irregularities, :specialty_coverage, :private_company, :company, :sic

  FACTOR_FIELDS = %w(claims_history
                     financial_conditions
                     industry
                     mergers_and_acquisitions
                     management_experience_qualifications
                     entity_nonentity_coverage
                     revenue_asset_irregularities
                     specialty_coverage
                     private_company
                     litigation)

  def initialize(company_info, sic, renewal)
    @company = company_info
    @renewal = renewal
    @sic = sic
    process_factors
  end

  def process_factors
    FACTOR_FIELDS.each do |field|
      send((field + '=').to_sym, "CalculatorApi::DnoFactors::#{field.camelize}".constantize.new(company, sic, renewal))
    end
  end
end
