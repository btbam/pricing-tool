class CreateComparableStateSms < ActiveRecord::Migration
  def change
    create_table :compare_state_sms do |t|
      t.integer :compare_id
      t.string :state

      t.timestamps
    end

    add_index :compare_state_sms, :compare_id
  end
end
