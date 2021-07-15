class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :title, null: false
      t.string :image
      t.text :description
      t.integer :created_year
      t.string :artist, null: false
      t.integer :type_id, null: false
      t.timestamps
    end
  end
end
