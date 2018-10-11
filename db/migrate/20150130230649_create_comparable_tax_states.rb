class CreateComparableTaxStates < ActiveRecord::Migration
  def change
    create_table :compare_tax_states do |t|
      t.integer :compare_id
      t.integer :code
      t.string :state

      t.timestamps
    end

    add_index :compare_tax_states, :compare_id
  end
end
