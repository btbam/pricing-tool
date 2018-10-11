class AddBusinessProductAndTypeToFactorTables < ActiveRecord::Migration
  def change
    add_column :calculator_financial_factors, :business_product_id, :integer
    add_column :calculator_financial_factors, :business_type_id, :integer
    add_column :calculator_industry_factors, :business_product_id, :integer
    add_column :calculator_industry_factors, :business_type_id, :integer

    add_index :calculator_financial_factors, :business_product_id
    add_index :calculator_financial_factors, :business_type_id
    add_index :calculator_industry_factors, :business_product_id
    add_index :calculator_industry_factors, :business_type_id
  end
end
