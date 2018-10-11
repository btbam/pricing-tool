FactoryGirl.define do
  factory :business_product, class: 'Business::Product' do
    name { %w(DO EPLI).sample }
  end
end
