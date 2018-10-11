class RenameIndustryFactorTable < ActiveRecord::Migration
  def change
    rename_table :industry_factors, :calculator_industry_factors
  end
end
