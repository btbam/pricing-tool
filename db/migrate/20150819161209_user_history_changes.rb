class UserHistoryChanges < ActiveRecord::Migration
  def change
    add_column :user_history_dos, :has_changed, :boolean, default: false
    add_column :user_history_dos, :industry, :decimal
    add_column :user_history_dos, :litigation, :decimal
    add_column :user_history_dos, :years_in_operation, :decimal

    add_column :user_history_eplis, :has_changed, :boolean, default: false
    add_column :user_history_eplis, :prior_acts_coverage, :decimal
    add_column :user_history_eplis, :punitive_damage, :decimal
    add_column :user_history_eplis, :years_in_operation, :decimal
  end
end
