class RenwalBusiness < ActiveRecord::Migration
  def change
    create_table :renewal_businesses do |t|
      t.integer :duns_number
      t.integer :business_product_id
      t.integer :business_type_id
      t.integer :policy_number
      t.date    :effective_date
      t.date    :expiration_date
      t.decimal :final_premium
      t.integer  :assets, :limit => 5
      t.decimal :industry
      t.decimal :recommended_industry
      t.integer  :occurrence_limit, :limit => 5
      t.integer  :aggregate_limit, :limit => 5
      t.integer :retention
      t.decimal :dnb_credit_score_factor
      t.decimal :prior_acts
      t.decimal :punitive_damages
      t.decimal :entity_nonentity_coverage
      t.decimal :mergers_and_aquisitions
      t.decimal :management_experience_qualifications
      t.decimal :litigation_factor
      t.decimal :litigation_ex_dno
      t.decimal :litigation
      t.decimal :revenue_asset_irregularities
      t.decimal :special_coverage
      t.decimal :private_company
      t.decimal :dno_percent_private_stock
      t.decimal :esop_ownership
      t.decimal :ipo
      t.decimal :public_debt
      t.decimal :nonentity_epli
      t.decimal :private_placement
      t.decimal :board_auditor

      t.timestamps
    end

    add_index :renewal_businesses, :business_product_id
    add_index :renewal_businesses, :business_type_id
    add_index :renewal_businesses, :duns_number
    add_index :renewal_businesses, :effective_date
    add_index :renewal_businesses, :expiration_date
  end
end
