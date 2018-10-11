class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :duns_number
      t.string :name
      t.integer :location_type_cd
      t.integer :subsidiary_indc

      t.timestamps
    end

    add_index :companies, :duns_number
  end
end
