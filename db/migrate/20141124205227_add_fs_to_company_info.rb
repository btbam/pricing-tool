class AddFsToCompanyInfo < ActiveRecord::Migration
  def change
    add_column :company_info201401s, :financial_stress_score, :decimal
  end
end
