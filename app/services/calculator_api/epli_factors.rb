class CalculatorApi::EpliFactors
  include ActiveModel::Serialization

  attr_accessor :company, :renewal, :human_resources_and_loss_prevention, :workforce_mgmt, :incident_mgmt,
                :financial_conditions, :claims_reporting_procedures, :claims_history, :industry_third_party,
                :prior_acts_coverage, :punitive_damage, :sic

  FACTOR_FIELDS = %w(human_resources_and_loss_prevention
                     workforce_mgmt
                     incident_mgmt
                     financial_conditions
                     claims_reporting_procedures
                     claims_history
                     industry_third_party
                     prior_acts_coverage
                     punitive_damage)

  def initialize(company_info, sic, renewal)
    @company = company_info
    @renewal = renewal
    @sic = sic
    process_factors
  end

  def process_factors
    FACTOR_FIELDS.each do |field|
      send((field + '=').to_sym, "CalculatorApi::EpliFactors::#{field.camelize}".constantize.new(company, sic, renewal))
    end
  end
end
