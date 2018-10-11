class CalculatorApi::DnoFactors::Industry < CalculatorApi::DnoFactors::Base
  def process_factor
    @factor = 1.44
    guidance_factor = Calculator::IndustryFactor.find_by_sic_code_dno(sic).try(:factor)
    renewal_factor = renewal.industry if renewal
    @factor = [guidance_factor.to_f, renewal_factor.to_f].max if guidance_factor || renewal_factor
  end
end
