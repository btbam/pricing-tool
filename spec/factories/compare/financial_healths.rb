FactoryGirl.define do
  factory :compare_financial_health, class: 'Compare::FinancialHealth' do
    financial_stress_score { "Class #{(1..5).to_a.sample}" }
  end
end
