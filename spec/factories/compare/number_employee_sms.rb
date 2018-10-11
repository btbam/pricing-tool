FactoryGirl.define do
  factory :compare_number_employee_sm, class: 'Compare::NumberEmployeeSm' do
    ranges = ['1 - 4',
              '4 - 9',
              '10 - 19',
              '20 - 49',
              '50 - 99',
              '100 - 249',
              '250 - 499',
              '500 - 999',
              '999 - 1000000000']
    klass { (1..9).to_a.sample }
    range { ranges.sample }
    range_high { RangeFromText.new(range).high }
    range_low { RangeFromText.new(range).low }

    after(:build) do |number_employee_sm|
      conflicts = Compare::NumberEmployeeSm.select_distinct(:range).map(&:range)
      if number_employee_sm.range && conflicts.include?(number_employee_sm.range)
        number_employee_sm.range = ranges.reject { |range| conflicts.include?(range) }.sample
        rft = RangeFromText.new(number_employee_sm.range)
        number_employee_sm.range_low = rft.low
        number_employee_sm.range_high = rft.high
      end
    end
  end
end
