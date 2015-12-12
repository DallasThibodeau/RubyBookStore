class AddIndexToAdsTitle < ActiveRecord::Migration
  def change
    add_index :ads, :title, unique: true
  end
end
