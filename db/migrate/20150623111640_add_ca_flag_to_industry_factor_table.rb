class AddCaFlagToIndustryFactorTable < ActiveRecord::Migration
  def change
    add_column :calculator_industry_factors, :ca, :boolean
  end
end
