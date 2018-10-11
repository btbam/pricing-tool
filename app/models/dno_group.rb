class DnoGroup < ActiveRecord::Base
  include ActiveModel::Serialization

  scope :peer_group, lambda { |industry_group, sales, stress_score|
    where(industry_groups: industry_group)
      .where("min_sales <=#{sales}  and max_sales >= #{sales}")
      .where("min_f <=#{stress_score}  and max_f >= #{stress_score}")
      .first
  }
end
