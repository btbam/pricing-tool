class CreateBusinessProducts < ActiveRecord::Migration
  def change
    create_table :business_products do |t|
      t.string :name

      t.timestamps
    end

    add_index :business_products, :name, length: 5
  end
end
