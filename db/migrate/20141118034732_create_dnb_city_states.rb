class CreateDnbCityStates < ActiveRecord::Migration
  def change
    create_table :dnb_city_states do |t|
      t.integer :city_code
      t.integer :state_code
      t.string :city
      t.string :state

      t.timestamps
    end

    add_index :dnb_city_states, :city_code
    add_index :dnb_city_states, :state_code
  end
end
