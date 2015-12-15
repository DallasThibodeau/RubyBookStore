class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      #t.string :book
      t.string :price
      #t.string :tags
      t.string :title
      t.string :description
      t.belongs_to :user, index: true
      t.belongs_to :books, index: true
      t.timestamps null: false
    end
  end
end
