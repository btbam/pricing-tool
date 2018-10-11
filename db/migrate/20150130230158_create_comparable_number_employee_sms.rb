class CreateComparableNumberEmployeeSms < ActiveRecord::Migration
  def change
    create_table :compare_number_employee_sms do |t|
      t.integer :compare_id
      t.integer :klass
      t.string :range

      t.timestamps
    end

    add_index :compare_number_employee_sms, :compare_id
  end
end
