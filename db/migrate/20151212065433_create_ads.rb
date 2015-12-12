class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :ad_book
      t.string :ad_price
      t.string :ad_tags
      t.string :ad_title
      t.string :ad_description
      t.string :ad_user
      t.timestamps null: false
    end
  end
end
