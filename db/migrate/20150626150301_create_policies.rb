class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.integer :policy_number
      t.integer :limit, limit: 8
      t.integer :retention, limit: 8
      t.integer :sales, limit: 8
      t.integer :gwp
      t.integer :loss_severity
      t.integer :tax_state_code
      t.string :tax_state_abbr
      t.integer :sic_code
      t.integer :duns_number
      t.references :business_product
      t.references :business_type
    end

    add_index :policies, :policy_number
    add_index :policies, :duns_number
    add_index :policies, :sic_code
  end
end
