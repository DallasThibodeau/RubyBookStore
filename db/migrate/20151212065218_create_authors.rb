class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :author_first_name
      t.string :author_last_name
      t.timestamps null: false
    end
  end
end
