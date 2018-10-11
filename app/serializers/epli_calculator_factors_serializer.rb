# EpliCalculatorFactorsSerializer
class EpliCalculatorFactorsSerializer < ActiveModel::Serializer
  self.root = false

  attributes :human_resources_and_loss_prevention, :workforce_mgmt, :incident_mgmt, :financial_conditions,
             :claims_reporting_procedures, :claims_history, :industry_third_party,
             :prior_acts_coverage, :punitive_damage, :global_employee_total

  def human_resources_and_loss_prevention
    object.human_resources_and_loss_prevention.factor
  end

  def workforce_mgmt
    object.workforce_mgmt.factor
  end

  def incident_mgmt
    object.incident_mgmt.factor
  end

  def financial_conditions
    object.financial_conditions.factor
  end

  def claims_reporting_procedures
    object.claims_reporting_procedures.factor
  end

  def claims_history
    object.claims_history.factor
  end

  def industry_third_party
    object.industry_third_party.factor
  end

  def prior_acts_coverage
    object.prior_acts_coverage.factor
  end

  def punitive_damage
    object.punitive_damage.factor
  end

  def global_employee_total
    object.company.global_employee_total
  end
end
