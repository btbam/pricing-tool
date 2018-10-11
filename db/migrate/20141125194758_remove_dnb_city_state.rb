class RemoveDnbCityState < ActiveRecord::Migration
  def change
  	drop_table :dnb_city_states
  end
end
