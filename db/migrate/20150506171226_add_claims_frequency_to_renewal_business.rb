class AddClaimsFrequencyToRenewalBusiness < ActiveRecord::Migration
  def change
    add_column :renewal_businesses, :claims_frequency_last_year, :decimal
    add_column :renewal_businesses, :claims_severity_last_year, :decimal
  end
end
