class CreateComparables < ActiveRecord::Migration
  def change
    create_table :compares do |t|
      t.integer :business_product_id
      t.integer :business_type_id
      t.integer :num_policies
      t.integer :num_policies_with_claims
      t.integer :num_policies_with_positive_claims
      t.integer :num_of_claims
      t.integer :num_of_claims_with_positive_payment
      t.decimal :loss_ratio
      t.integer :business_year_id
      t.integer :compare_type_id
      t.string  :compare_type_type

      t.timestamps
    end

    add_index :compares, :business_product_id
    add_index :compares, :business_type_id
    add_index :compares, :business_year_id
    add_index :compares, :compare_type_id
    add_index :compares, :compare_type_type
  end
end
