class UpdateUserHistory < ActiveRecord::Migration
  def change
    add_column :user_histories, :assets, :bigint
    add_column :user_histories, :years_in_operation, :integer
    add_column :user_histories, :sic_code, :integer
    add_column :user_histories, :user_history_do_id, :integer
    add_column :user_histories, :user_history_epli_id, :integer

    add_index :user_histories, :user_history_do_id
    add_index :user_histories, :user_history_epli_id
  end
end
