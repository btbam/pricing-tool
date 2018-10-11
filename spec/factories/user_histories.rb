FactoryGirl.define do
  factory :user_history do
    user_id 2
    duns_number { Faker::Company.duns_number.tr('^0-9', '').to_i }
  end
end
