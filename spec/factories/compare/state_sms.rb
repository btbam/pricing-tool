FactoryGirl.define do
  factory :compare_state_sm, class: 'Compare::StateSm' do
    state { Faker::Address.state }

    after(:build) do |state_sm|
      conflicts = Compare::StateSm.select_distinct(:state).map(&:state)
      while state_sm.state && conflicts.include?(state_sm.state)
        state_sm.state = Faker::Address.state
      end
    end
  end
end
