FactoryGirl.define do
  factory :compare_industry, class: 'Compare::Industry' do
    sic_code { (1..50).to_a.sample }
    name { Faker::Company.catch_phrase }

    after(:build) do |industry|
      conflicts = Compare::Industry.select_distinct(:name).map(&:name)
      while industry.name && conflicts.include?(industry.name)
        industry.name = Faker::Address.state_abbr
      end
    end
  end
end
