class Compare::FinancialHealth < ActiveRecord::Base
  include Compare::Base

  scope :by_financial_stress_score, ->(klass) { where(financial_stress_score: "Class #{klass}") }
end
