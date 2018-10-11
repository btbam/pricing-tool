class CreateComparableFinancialHealths < ActiveRecord::Migration
  def change
    create_table :compare_financial_healths do |t|
      t.integer :compare_id
      t.string :financial_stress_score

      t.timestamps
    end

    add_index :compare_financial_healths, :compare_id
  end
end
