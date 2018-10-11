class AddGroupCodeToEpliGroups < ActiveRecord::Migration
  def change
    add_column :epli_groups, :group_code, :integer
  end
end
