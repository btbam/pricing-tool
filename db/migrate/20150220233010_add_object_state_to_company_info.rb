class AddObjectStateToCompanyInfo < ActiveRecord::Migration
  def change
  	add_column :company_infos, :object_state, :string
  end
end
