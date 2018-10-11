class CalculatorApi::EpliFactors::Base
  attr_accessor :company, :renewal, :factor, :sic

  def initialize(company_info, sic, renewal)
    @company = company_info
    @renewal = renewal
    @sic = sic
    @factor = 1
    process_factor
  end

  def process_factor
    true
  end
end
