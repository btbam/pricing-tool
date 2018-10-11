class CreateUserHistories < ActiveRecord::Migration
  def change
    create_table :user_histories do |t|
      t.integer :user_id
      t.integer :duns_number

      t.timestamps
    end

    add_index :user_histories, :user_id
    add_index :user_histories, :duns_number
  end
end
