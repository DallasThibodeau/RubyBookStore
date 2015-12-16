class CreateStarratings < ActiveRecord::Migration
  def change
    create_table :starratings do |t|
      t.float :rating
      t.integer :ownerID
      t.integer :raterID
      t.belongs_to :ad, index: true
    end
  end
end
