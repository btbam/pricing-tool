FactoryGirl.define do
  compare_klasses = [:compare_book,
                     :compare_company_size_sale_sm,
                     :compare_financial_health,
                     :compare_industry,
                     :compare_number_employee_sm,
                     :compare_salary_sale_sm,
                     :compare_state_sm,
                     :compare_tax_state
                    ]

  compare_klasses.each do |klass|
    factory_name = ('compare_' + klass.to_s).to_sym
    factory factory_name, class: 'Compare' do
      sample_array = (1..1_000_000).to_a
      num_policies { sample_array.sample }
      num_policies_with_claims { sample_array.sample }
      num_policies_with_positive_claims { sample_array.sample }
      num_of_claims { sample_array.sample }
      num_of_claims_with_positive_payment { sample_array.sample }
      loss_ratio { (1..200).to_a.sample.to_f / 100 }
      association :compare_type, factory: klass
      association :business_type
      association :business_product
      association :business_year

      after(:create) do |compare|
        compare.compare_type.compare_id = compare.id
      end
    end
  end
end
