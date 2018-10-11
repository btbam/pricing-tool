class CalculatorApi::DnoFactors::PrivateCompany < CalculatorApi::DnoFactors::Base
  attr_accessor :dno_percent_private_stock, :esop_ownership, :ipo,
                :private_placement, :nonentity_epli, :board_auditor,
                :public_debt

  def initialize(*args)
    @dno_percent_private_stock = 1
    @esop_ownership = 1
    @ipo = 1
    @private_placement = 1
    @nonentity_epli = 1
    @board_auditor = 1
    @public_debt = 1
    super
  end

  def process_factor
    return unless renewal

    process_subfactor(:dno_percent_private_stock, low: 0.8, high: 1)
    process_subfactor(:esop_ownership, low: 1, high: 1.5)
    process_subfactor(:ipo)
    process_subfactor(:private_placement)
    process_subfactor(:nonentity_epli)
    process_subfactor(:board_auditor)
    process_subfactor(:public_debt)
  end

  private

  def process_subfactor(subfactor, default: 1, low: nil, high: nil)
    value = renewal.send(subfactor).to_f
    if low && high
      return unless value.between?(low, high)
    else
      value = [default, value].max
    end
    instance_variable_set("@#{subfactor}".to_sym, value)
  end
end
