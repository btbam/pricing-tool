class UserHistorySerializer < ActiveModel::Serializer
  self.root = false

  attributes :assets, :dno_factors, :epli_factors, :sic_code, :years_in_operation

  def dno_factors
    UserHistorySerializer::Dno.new(object.user_history_do)
  end

  def epli_factors
    UserHistorySerializer::Epli.new(object.user_history_epli)
  end
end
