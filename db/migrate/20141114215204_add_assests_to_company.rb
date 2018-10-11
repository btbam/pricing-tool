class AddAssestsToCompany < ActiveRecord::Migration
  def change
  	add_column :company_info201401s, :total_net_worth, :bigint
  end
end
