class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :authors 
      t.string :user
      t.string :publishers
      t.integer :num_of_pages
      t.integer :edition
      t.boolean :isHardcover 
      t.timestamps null: false
    end
  end
end
