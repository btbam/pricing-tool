FactoryGirl.define do
  factory :compare_company_size_sale_sm, class: 'Compare::CompanySizeSaleSm' do
    ranges = ['0M - 0.25M', '0.25M - 1.2M', '1.2M - 5M', '5M - 25M', '25M - 1000000000M']
    klass { (1..5).to_a.sample }
    range { ranges.sample }
    range_high { RangeFromText.new(range).high }
    range_low { RangeFromText.new(range).low }

    after(:build) do |company_size_sale_sm|
      conflicts = Compare::CompanySizeSaleSm.select_distinct(:range).map(&:range)
      if company_size_sale_sm.range && conflicts.include?(company_size_sale_sm.range)
        company_size_sale_sm.range = ranges.reject { |range| conflicts.include?(range) }.sample
        rft = RangeFromText.new(company_size_sale_sm.range)
        company_size_sale_sm.range_low = rft.low
        company_size_sale_sm.range_high = rft.high
      end
    end
  end
end
