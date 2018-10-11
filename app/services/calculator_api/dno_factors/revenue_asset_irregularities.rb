class CalculatorApi::DnoFactors::RevenueAssetIrregularities < CalculatorApi::DnoFactors::Base
  def process_factor
    return unless renewal
    renewal_factor = renewal.revenue_asset_irregularities.to_f
    factor = [1, renewal_factor].max
    @factor = factor if factor.between?(1, 1.75)
  end
end
