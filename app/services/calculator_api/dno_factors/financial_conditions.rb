class CalculatorApi::DnoFactors::FinancialConditions < CalculatorApi::DnoFactors::Base
  def process_factor
    @factor = 1
    financial_factor = Calculator::FinancialFactor.find_by_dnb_dno(company.financial_stress_score) if company
    guidance_factor = financial_factor.relativity_factor if financial_factor
    renewal_factor = renewal.industry if renewal
    @factor = [guidance_factor.to_f, renewal_factor.to_f].max if guidance_factor || renewal_factor
  end
end
