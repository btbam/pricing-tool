class AddSic00CodeToPolicies < ActiveRecord::Migration
  def change
    add_column :policies, :sic_00_code, :integer
    add_index :policies, :sic_00_code
    add_index :policies, :policy_year
  end
end
