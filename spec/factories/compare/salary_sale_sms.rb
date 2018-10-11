FactoryGirl.define do
  factory :compare_salary_sale_sm, class: 'Compare::SalarySaleSm' do
    ranges = ['0k - 35k', '35k - 60k', '60k - 85k', '85k - 150k', '150k - 5000000k']
    klass { (1..5).to_a.sample }
    range { ranges.sample }
    range_high { RangeFromText.new(range).high }
    range_low { RangeFromText.new(range).low }

    after(:build) do |salary_sale_sm|
      conflicts = Compare::SalarySaleSm.select_distinct(:range).map(&:range)
      if salary_sale_sm.range && conflicts.include?(salary_sale_sm.range)
        salary_sale_sm.range = ranges.reject { |range| conflicts.include?(range) }.sample
        rft = RangeFromText.new(salary_sale_sm.range)
        salary_sale_sm.range_low = rft.low
        salary_sale_sm.range_high = rft.high
      end
    end
  end
end
