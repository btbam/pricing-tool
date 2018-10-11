class CreateIndustryGroups < ActiveRecord::Migration
  def change
    create_table :industry_groups do |t|
      t.integer :sic_code
      t.string :industry
      t.integer :group_code
      t.integer :business_product_id
      t.integer :business_type_id
    end

    add_index :industry_groups, :group_code
    add_index :industry_groups, :industry
    add_index :industry_groups, :sic_code
    add_index :industry_groups, :business_product_id
    add_index :industry_groups, :business_type_id
  end
end
