class EpliGroup < ActiveRecord::Base
  include ActiveModel::Serialization

  scope :peer_group, lambda { |state_group, industry_group, employee_total|
    where(state_groups: state_group, industry_groups: industry_group)
      .where("min_empl <=#{employee_total}  and max_empl >= #{employee_total}")
      .first
  }
end
