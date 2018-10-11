class RemoveAddressFromCompanyInfo < ActiveRecord::Migration
  def change
    remove_column :company_info201401s, :zip_code
    remove_column :company_info201401s, :dnb_city_code
    remove_column :company_info201401s, :dnb_metro_code
    remove_column :company_info201401s, :dnb_state
  end
end
