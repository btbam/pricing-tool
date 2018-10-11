class RemoveOwnershipsFromCompanyInfo < ActiveRecord::Migration
  def change
    remove_column :company_info201401s, :foreign_owned
    remove_column :company_info201401s, :ownership
    remove_column :company_info201401s, :subsidiary
    remove_column :company_info201401s, :minority_owned
    remove_column :company_info201401s, :woman_owned
    remove_column :company_info201401s, :franchise
  end
end
