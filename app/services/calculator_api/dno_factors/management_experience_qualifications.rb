class CalculatorApi::DnoFactors::ManagementExperienceQualifications < CalculatorApi::DnoFactors::Base
  def process_factor
    return unless renewal
    renewal_factor = renewal.management_experience_qualifications.to_f
    factor = [1, renewal_factor].max
    @factor = factor if factor.between?(1, 1.3)
  end
end
