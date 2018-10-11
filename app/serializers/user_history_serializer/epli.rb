class UserHistorySerializer::Epli < ActiveModel::Serializer
  self.root = false

  attributes :california_non_union_full_time, :california_non_union_part_time, :california_union_full_time,
             :california_union_part_time, :claims_history, :claims_reporting_procedures,
             :dc_mi_fl_tx_non_union_full_time, :dc_mi_fl_tx_non_union_part_time,
             :dc_mi_fl_tx_union_full_time, :dc_mi_fl_tx_union_part_time, :financial_conditions,
             :has_changed, :human_resources_and_loss_prevention, :incident_mgmt,
             :industry_third_party, :limit, :prior_acts_coverage, :punitive_damage, :retention,
             :total_foreign_full_time, :total_foreign_part_time, :total_non_union_full_time,
             :total_non_union_part_time, :total_union_full_time, :total_union_part_time, :workforce_mgmt,
             :years_in_operation
end
