class CalculatorApi::DnoFactors::Litigation < CalculatorApi::DnoFactors::Base
  attr_accessor :litigation_ex_dno, :litigation

  def initialize(*args)
    @litigation_ex_dno = 1
    @litigation = 1
    super
  end

  def process_factor
    return unless renewal

    @litigation_ex_dno = [1, renewal.litigation_ex_dno.to_f].max
    @litigation = [1, renewal.litigation.to_f].max

    factor = [1, renewal.litigation_factor.to_f].max
    @factor = factor if factor.between?(1, 1.3)
  end
end
