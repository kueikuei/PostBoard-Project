class AddAllTable < ActiveRecord::Migration[5.0]
  def change
  	
    create_table :admins do |t|
      t.string :name
      t.string :password_digest 
      t.timestamps null: false
    end

    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :password_digest   
      t.timestamps null: false
    end

    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer  :user_id
      t.timestamps null: false
    end

    create_table :categories do |t|
      t.string :tag
      t.timestamps null: false
    end

    create_table :connections, id: false do |t|
      t.belongs_to :post, index: true
      t.belongs_to :category, index: true
    end

    create_table :comments do |t|
      t.text :reply
      t.integer  :user_id
      t.integer  :post_id
      t.timestamps null: false
    end

    
  end
end
