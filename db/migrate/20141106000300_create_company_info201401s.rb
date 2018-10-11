class CreateCompanyInfo201401s < ActiveRecord::Migration
  def change
    create_table :company_info201401s do |t|
      t.integer  :duns_number
      t.string   :industry_code
      t.integer  :global_employee_total
      t.date     :incorporation_date
      t.date     :dnb_last_updated
      t.integer  :start_year
      t.boolean  :out_of_business
      t.boolean  :foreign_owned
      t.string   :ownership
      t.boolean  :subsidiary
      t.boolean  :is_public
      t.boolean  :minority_owned
      t.boolean  :woman_owned
      t.string   :franchise
      t.column   :sales_volume, :bigint
      t.boolean  :small_business
      t.string   :condition
      t.integer  :local_employee_total
      t.string   :zip_code
      t.integer  :dnb_city_code
      t.integer  :dnb_metro_code

      t.timestamps
    end

    add_index :company_info201401s, :duns_number
  end
end