FactoryGirl.define do
  factory :policy do
    id { Faker::Number.positive(1, 99) }
    policy_number { Faker::Number.positive(1, 99) }
    limit { Faker::Number.positive(1, 99) }
    retention { Faker::Number.positive(1, 99) }
    sales { Faker::Number.positive(1, 99) }
    gwp { Faker::Number.positive(1, 99) }
    loss_severity { Faker::Number.positive(1, 99) }
    tax_state_code { Faker::Number.positive(1, 99) }
    tax_state_abbr Faker::Address.state_abbr
    sic_code { Faker::Number.positive(1, 99) }
    sic_00_code { Faker::Number.positive(1, 99) }
    duns_number { Faker::Number.positive(1, 99) }
    business_product_id 2
    business_type_id 2
    policy_year 2007
  end
end
