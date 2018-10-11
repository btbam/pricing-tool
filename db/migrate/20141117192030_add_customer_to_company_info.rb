class AddCustomerToCompanyInfo < ActiveRecord::Migration
  def change
  	add_column :company_info201401s, :customer, :boolean
  end
end
