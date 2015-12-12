class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :book_title
      t.string :book_authors 
      t.string :book_user
      t.string :book_publishers
      t.int :book_num_of_pages
      t.int :book_edition
      t.boolean :book_isHardcover 
      t.timestamps null: false
    end
  end
end
