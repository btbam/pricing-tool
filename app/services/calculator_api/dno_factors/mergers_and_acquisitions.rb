class CalculatorApi::DnoFactors::MergersAndAcquisitions < CalculatorApi::DnoFactors::Base
  def process_factor
    @factor = renewal.mergers_and_acquisitions || 1 if renewal
  end
end
