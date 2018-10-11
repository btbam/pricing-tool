class CreateBusinessYears < ActiveRecord::Migration
  def change
    create_table :business_years do |t|
      t.string :name

      t.timestamps
    end

    add_index :business_years, :name, length: 5
  end
end
