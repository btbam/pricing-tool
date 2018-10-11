class CreateCalculatorFinancialFactors < ActiveRecord::Migration
  def change
    create_table :calculator_financial_factors do |t|
      t.integer :dnb_financial_distress_score
      t.decimal :relativity_factor

      t.timestamps
    end
    add_index :calculator_financial_factors, :dnb_financial_distress_score, name: 'financial_factors'
  end
end
