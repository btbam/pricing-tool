class AddIndexesToPolicies < ActiveRecord::Migration
  def change
    add_index :policies, :business_product_id
    add_index :policies, :business_type_id
  end
end
