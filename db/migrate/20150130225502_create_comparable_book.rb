class CreateComparableBook < ActiveRecord::Migration
  def change
    create_table :compare_books do |t|
      t.integer  :compare_id
      t.string   :rate_needed_14

      t.timestamps
    end

    add_index :compare_books, :compare_id
  end
end
