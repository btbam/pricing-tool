class CalculatorApi::DnoFactors::SpecialtyCoverage < CalculatorApi::DnoFactors::Base
  attr_accessor :punitive_damages, :prior_acts

  def initialize(*args)
    @punitive_damages = 1
    @prior_acts = 1
    super
  end

  def process_factor
    return unless renewal

    punitive_damages = renewal.punitive_damages.to_f
    prior_acts = renewal.prior_acts.to_f

    @punitive_damages = punitive_damages if punitive_damages.between?(1, 1.4)
    @prior_acts = prior_acts if prior_acts.between?(0.7, 1)
  end
end
