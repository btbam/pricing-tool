# CalculatorSerializer
class CalculatorSerializer < ActiveModel::Serializer
  self.root = false

  attributes :financial_institution, :assets, :retention,
             :limit, :dno_factors, :epli_factors, :user_history

  def dno_factors
    DnoCalculatorFactorsSerializer.new(object.dno_factors)
  end

  def epli_factors
    EpliCalculatorFactorsSerializer.new(object.epli_factors)
  end

  def user_history
    UserHistorySerializer.new(object.user_history)
  end
end
