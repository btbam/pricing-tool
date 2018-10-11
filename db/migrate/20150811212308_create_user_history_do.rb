class CreateUserHistoryDo < ActiveRecord::Migration
  def change
    create_table :user_history_dos do |t|
      t.column  :limit, :bigint
      t.column  :retention, :bigint
      t.decimal :claims_history
      t.decimal :financial_conditions
      t.decimal :mergers_and_acquisitions
      t.decimal :management_experience_qualifications
      t.decimal :entity_nonentity_coverage
      t.decimal :revenue_asset_irregularities
      t.decimal :specialty_coverage
      t.decimal :private_company
      t.timestamps
    end
  end
end
