class CreateIndustryAverages < ActiveRecord::Migration
  def change
    create_table :industry_averages do |t|
      t.string :category
      t.integer :sic_code
      t.string :sic_description
      t.integer :num_policies
      t.decimal :avg_employees
      t.column :avg_revenue, :bigint
      t.decimal :avg_financial_stress
      t.decimal :avg_year_started
      t.decimal :median_employees
      t.column :median_revenue, :bigint
      t.decimal :median_financial_stress
      t.integer :median_year_started

      t.timestamps
    end

    add_index :industry_averages, :sic_code
  end
end
