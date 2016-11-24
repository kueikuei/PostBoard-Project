class RemovePasswordColumn < ActiveRecord::Migration[5.0]
  def change
  	remove_column :admins, :password_digest
  	remove_column :users, :password_digest
  end
end
