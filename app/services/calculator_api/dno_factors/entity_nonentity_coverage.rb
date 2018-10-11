class CalculatorApi::DnoFactors::EntityNonentityCoverage < CalculatorApi::DnoFactors::Base
  def process_factor
    return unless renewal
    renewal_factor = renewal.entity_nonentity_coverage.to_f
    @factor = renewal_factor if renewal_factor.between?(0.8, 1)
  end
end
