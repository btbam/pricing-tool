class CreateComparableIndustries < ActiveRecord::Migration
  def change
    create_table :compare_industries do |t|
      t.integer :compare_id
      t.integer :sic_code
      t.string :name

      t.timestamps
    end

    add_index :compare_industries, :compare_id
  end
end
