class CalculatorApi::DnoFactors::ClaimsHistory < CalculatorApi::DnoFactors::Base
  attr_accessor :frequency, :severity

  def initialize(*args)
    @frequency = 1
    @severity = 1
    super
  end

  def process_factor
    return unless renewal
    @frequency = renewal.claims_frequency_last_year.to_f
    @severity = renewal.claims_severity_last_year.to_f
  end
end
