class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :ad_id
      t.text :body
      t.string :user_name

      t.timestamps null: false
    end
    add_index :comments, :ad_id
  end
end
