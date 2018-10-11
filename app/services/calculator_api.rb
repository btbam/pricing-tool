class CalculatorApi
  include ActiveModel::Serialization

  attr_accessor :financial_institution, :assets, :retention, :limit, :dno_factors, :epli_factors, :company,
                :years_in_operation, :dno_renewal, :epli_renewal, :sic, :user_history

  def initialize(company_info, sic, user_history)
    @company = company_info
    @sic = sic
    @user_history = user_history
    process_company
    process_renewal
    process_factors
  end

  private

  def process_company
    @financial_institution = company.financial_institution?
    @assets = ''
    @years_in_operation = company.years_since_start
  end

  def process_renewal
    @dno_renewal = company.dno_renewal
    @epli_renewal = company.epli_renewal
    @retention = @dno_renewal.try(:retention) || 100_000
    @limit = @dno_renewal.try(:limit) || 100_000
  end

  def process_factors
    @dno_factors = CalculatorApi::DnoFactors.new(company, sic, dno_renewal)
    @epli_factors = CalculatorApi::EpliFactors.new(company, sic, epli_renewal)
  end
end
