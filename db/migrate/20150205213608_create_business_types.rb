class CreateBusinessTypes < ActiveRecord::Migration
  def change
    create_table :business_types do |t|
      t.string :name

      t.timestamps
    end

    add_index :business_types, :name, length: 5
  end
end
