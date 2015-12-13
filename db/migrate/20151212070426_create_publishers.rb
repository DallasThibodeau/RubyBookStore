class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name
      t.belongs_to :book, index: true
      t.timestamps null: false
    end
  end
end
