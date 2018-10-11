FactoryGirl.define do
  factory :industry_average do
    sic_code { Faker::Number.positive.to_i }
    avg_financial_stress { Faker::Number.positive(0.00, 1800.00) }
  end
end
