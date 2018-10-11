FactoryGirl.define do
  factory :dno_group do
    industry_groups { Faker::Company.name }
    min_sales { Faker::Number.positive(1, 50) }
    max_sales { Faker::Number.positive(50, 99) }
    min_f { Faker::Number.positive(1, 50) }
    max_f { Faker::Number.positive(50, 99) }
  end
end
