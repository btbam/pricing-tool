class CreateComparableSalarySaleCs < ActiveRecord::Migration
  def change
    create_table :compare_salary_sale_cs do |t|
      t.integer :compare_id
      t.integer :klass
      t.string :range

      t.timestamps
    end

    add_index :compare_salary_sale_cs, :compare_id
  end
end
