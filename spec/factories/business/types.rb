FactoryGirl.define do
  factory :business_type, class: 'Business::Type' do
    name { %w(NFP PRIVATE).sample }
  end
end
