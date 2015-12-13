class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :num_of_pages
      t.integer :edition
      t.boolean :isHardcover     
      t.belongs_to :ad, index: true
      t.timestamps null: false
    end
  end
end
