FactoryGirl.define do
  factory :industry_group do
    sic_code { Faker::Number.positive.to_i }
    industry { Faker::Company.name }
    business_product_id 2
    business_type_id 2
  end
end
