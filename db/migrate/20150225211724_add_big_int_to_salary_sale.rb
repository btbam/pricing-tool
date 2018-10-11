class AddBigIntToSalarySale < ActiveRecord::Migration
  def change
    change_column :compare_salary_sale_sms, :range_high, :bigint
  end
end
