class AddEmployeeCountToPolicy < ActiveRecord::Migration
  def change
    add_column :policies, :employee_count, :bigint
  end
end
