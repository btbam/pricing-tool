class IndustryFactors < ActiveRecord::Migration
  def change
    create_table :industry_factors do |t|
      t.integer :sic_code
      t.string :name
      t.decimal :factor
      t.timestamps
    end
    add_index :industry_factors, :sic_code
  end
end
