class AddIndexToPublishersName < ActiveRecord::Migration
  def change
    add_index :publishers, :name, unique: true
  end
end
