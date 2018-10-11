class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :product
      t.string :policy_type
      t.integer :duns_number
      t.string :insured_name
      t.integer :policy_year

      t.timestamps
    end

    add_index :customers, :duns_number
  end
end
