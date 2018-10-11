FactoryGirl.define do
  factory :company_info do
    transient do
      customer false
    end

    name { Faker::Company.name }
    duns_number { Faker::Company.duns_number.tr('^0-9', '').to_i }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip_code { Faker::Address.zip_code }
    as_of_date { Faker::Date.backward }
    financial_stress_score { Faker::Number.positive(50.00, 1800.00) }
    tree_pos { Faker::Number.positive(1, 5) }
    industry_code { Faker::Number.positive(1, 99) }
    global_employee_total { Faker::Number.positive(1, 50) }

    after(:create) do |company_info, evaluator|
      create(:customer, duns_number: company_info.duns_number) if evaluator.customer == 1
    end
  end
end
