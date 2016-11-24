class ReaddPasswordColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :admins, :password_digest, :string
  	add_column :users, :password_digest, :string
  end
end
