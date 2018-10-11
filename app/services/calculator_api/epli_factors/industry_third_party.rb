class CalculatorApi::EpliFactors::IndustryThirdParty < CalculatorApi::EpliFactors::Base
  def process_factor
    guidance_factor = Calculator::IndustryFactor.find_by_sic_code_epli(sic, ca_flag).try(:factor)
    renewal_factor = renewal.industry if renewal
    @factor = [guidance_factor.to_f, renewal_factor.to_f].max if guidance_factor || renewal_factor
  end

  def ca_flag
    company.hq_state.to_s.upcase == 'CA'
  end
end
