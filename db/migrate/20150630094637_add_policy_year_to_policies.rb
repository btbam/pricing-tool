class AddPolicyYearToPolicies < ActiveRecord::Migration
  def change
    add_column :policies, :policy_year, :integer
  end
end
