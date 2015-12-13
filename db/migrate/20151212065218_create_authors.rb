class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :book, index: true
      t.timestamps null: false
    end
  end
end
