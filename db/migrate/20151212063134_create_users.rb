class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_first_name
      t.string :user_last_name 
      t.string :user_nickname
      t.string :user_email 
      t.string :user_address
      t.string :user_phone 
      t.boolean :user_isAdmin
      t.timestamps null: false
    end
  end
end
