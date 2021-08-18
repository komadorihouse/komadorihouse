class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.text :title
      t.string :text_1
      t.string :image_1
      t.string :text_2
      t.string :image_2
      t.string :text_3
      t.string :image_3
      t.timestamps
    end
  end
end
