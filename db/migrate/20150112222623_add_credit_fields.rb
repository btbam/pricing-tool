class AddCreditFields < ActiveRecord::Migration
  def change
    add_column :company_info201401s, :credit_score_class, :integer
    add_column :company_info201401s, :credit_score, :decimal
    add_column :company_info201401s, :financial_stress_score_class, :integer
  end
end
