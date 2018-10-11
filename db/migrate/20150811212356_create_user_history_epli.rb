class CreateUserHistoryEpli < ActiveRecord::Migration
  def change
    create_table :user_history_eplis do |t|
      t.column  :limit, :bigint
      t.column  :retention, :bigint
      t.decimal :human_resources_and_loss_prevention
      t.decimal :workforce_mgmt
      t.decimal :incident_mgmt
      t.decimal :financial_conditions
      t.decimal :claims_reporting_procedures
      t.decimal :claims_history
      t.decimal :industry_third_party
      t.decimal :prior_acts_coverage
      t.decimal :punitive_damage
      t.integer :total_non_union_full_time
      t.integer :total_non_union_part_time
      t.integer :total_union_full_time
      t.integer :total_union_part_time
      t.integer :total_foreign_full_time
      t.integer :total_foreign_part_time
      t.integer :california_non_union_full_time
      t.integer :california_non_union_part_time
      t.integer :california_union_full_time
      t.integer :california_union_part_time
      t.integer :dc_mi_fl_tx_non_union_full_time
      t.integer :dc_mi_fl_tx_non_union_part_time
      t.integer :dc_mi_fl_tx_union_full_time
      t.integer :dc_mi_fl_tx_union_part_time

      t.timestamps
    end
  end
end
