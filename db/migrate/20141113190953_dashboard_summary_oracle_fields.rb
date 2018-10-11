class DashboardSummaryOracleFields < ActiveRecord::Migration
  def change
    add_column :company_info201401s, :dnb_state, :string
    add_column :company_info201401s, :phone_number, :string
    add_column :company_info201401s, :hq_state, :string
    add_column :company_info201401s, :description, :text
    add_column :company_info201401s, :url, :string
  end
end
