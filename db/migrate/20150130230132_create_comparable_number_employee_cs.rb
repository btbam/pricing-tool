class CreateComparableNumberEmployeeCs < ActiveRecord::Migration
  def change
    create_table :compare_number_employee_cs do |t|
      t.integer :compare_id
      t.integer :klass
      t.string :range

      t.timestamps
    end

    add_index :compare_number_employee_cs, :compare_id
  end
end
