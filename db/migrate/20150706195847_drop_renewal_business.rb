class DropRenewalBusiness < ActiveRecord::Migration
  def change
    drop_table :renewal_businesses
  end
end
