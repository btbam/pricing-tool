class RenameCompanyInfo < ActiveRecord::Migration
  def change
  	rename_table :company_info201401s, :company_infos
  end
end
