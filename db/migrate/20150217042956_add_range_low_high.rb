class AddRangeLowHigh < ActiveRecord::Migration
  def change
  	add_column :compare_number_employee_sms, :range_low, :integer
  	add_column :compare_number_employee_sms, :range_high, :integer
  	
  	add_column :compare_salary_sale_sms, :range_low, :integer
  	add_column :compare_salary_sale_sms, :range_high, :integer

  	add_column :compare_company_size_sale_sms, :range_low, :integer
  	add_column :compare_company_size_sale_sms, :range_high, :integer
  end
end
