class CreateStarratings < ActiveRecord::Migration
  def change
    create_table :starratings do |t|
      t.float :rating
      t.integer :ownerID
      t.integer :raterID
      t.belongs_to :ad, index: true
    end
<<<<<<< HEAD
  #execute "ALTER TABLE words ADD PRIMARY KEY (ownerID,raterID);"
=======
>>>>>>> b0b66a54bdf311bd462fbee2811e0d8d298f02d3
  end
end
