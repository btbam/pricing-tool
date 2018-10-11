class AddOracleCompoundKeyToCompanyInfo < ActiveRecord::Migration
  def change
  	add_column :company_infos, :compound_key, :string
  	add_index :company_infos, :compound_key, length: 15
  end
end
