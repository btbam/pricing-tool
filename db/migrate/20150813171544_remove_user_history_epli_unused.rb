class RemoveUserHistoryEpliUnused < ActiveRecord::Migration
  def change
    remove_column :user_history_eplis, :prior_acts_coverage
    remove_column :user_history_eplis, :punitive_damage
  end
end
