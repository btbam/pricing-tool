FactoryGirl.define do
  factory :epli_group do
    industry_groups { Faker::Company.name }
    state_groups { %w(All).sample }
    min_empl { Faker::Number.positive(1, 50) }
    max_empl { Faker::Number.positive(50, 99) }
  end
end
