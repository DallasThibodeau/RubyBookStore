class AddIndexToAuthorsLastName < ActiveRecord::Migration
  def change
    add_index :authors, :last_name, unique: true
  end
end
