class CalculatorApi::EpliFactors::ClaimsHistory < CalculatorApi::EpliFactors::Base
  def process_factor
    @factor = 0.8 if company.hq_state != 'CA'
  end
end
