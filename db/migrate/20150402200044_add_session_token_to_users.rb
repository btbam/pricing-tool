class AddSessionTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :session_token, :string, limit: 128
  end
end
