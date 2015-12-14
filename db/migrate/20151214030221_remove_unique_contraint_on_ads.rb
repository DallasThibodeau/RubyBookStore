class RemoveUniqueContraintOnAds < ActiveRecord::Migration
  def change
    remove_index(:ads, :name => 'index_ads_on_title')
  end
end
