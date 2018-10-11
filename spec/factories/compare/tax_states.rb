FactoryGirl.define do
  factory :compare_tax_state, class: 'Compare::TaxState' do
    state { Faker::Address.state }
    code { (1..50).to_a.sample }

    after(:build) do |tax_state|
      conflicts = Compare::TaxState.select_distinct(:state).map(&:state)
      while tax_state.state && conflicts.include?(tax_state.state)
        tax_state.state = Faker::Address.state
      end
    end
  end
end
