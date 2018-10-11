FactoryGirl.define do
  factory :compare_book, class: 'Compare::Book' do
    rate_needed_14 { [0.039, 0, 0.075].sample }
    target_loss_ratio { 0.97 }
  end
end
