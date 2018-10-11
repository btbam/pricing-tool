class ChangeRangeHighToBigInt < ActiveRecord::Migration
  def change
    change_column :compare_company_size_sale_sms, :range_high, :bigint
  end
end
