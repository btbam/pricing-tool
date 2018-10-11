class RemoveIndustryCodeFromCompanyInfo < ActiveRecord::Migration
  def change
    remove_column :company_info201401s, :industry_code
  end
end
