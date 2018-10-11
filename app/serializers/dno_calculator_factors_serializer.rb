# DnoCalculatorFactorsSerializer
class DnoCalculatorFactorsSerializer < ActiveModel::Serializer
  self.root = false

  attributes :claims_history, :financial_conditions, :industry, :litigation,
             :mergers_and_acquisitions, :management_experience_qualifications, :entity_nonentity_coverage,
             :revenue_asset_irregularities, :specialty_coverage, :private_company

  def claims_history
    factor = object.claims_history
    {
      frequency: factor.frequency,
      severity: factor.severity
    }
  end

  def financial_conditions
    object.financial_conditions.factor
  end

  def industry
    object.industry.factor
  end

  def litigation
    factor = object.litigation
    {
      litigation_ex_dno: factor.litigation_ex_dno,
      litigation: factor.litigation
    }
  end

  def mergers_and_acquisitions
    object.mergers_and_acquisitions.factor
  end

  def management_experience_qualifications
    object.management_experience_qualifications.factor
  end

  def entity_nonentity_coverage
    object.entity_nonentity_coverage.factor
  end

  def revenue_asset_irregularities
    object.revenue_asset_irregularities.factor
  end

  def specialty_coverage
    factor = object.specialty_coverage
    {
      punitive_damages: factor.punitive_damages,
      prior_acts: factor.prior_acts
    }
  end

  def private_company
    factor = object.private_company
    {
      dno_percent_private_stock: factor.dno_percent_private_stock,
      esop_ownership: factor.esop_ownership,
      ipo: factor.ipo,
      private_placement: factor.private_placement,
      nonentity_epli: factor.nonentity_epli,
      board_auditor: factor.board_auditor,
      public_debt: factor.public_debt
    }
  end
end
