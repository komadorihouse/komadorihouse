class AddImage3ToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :image3, :string
    add_column :works, :image4, :string
    add_column :works, :image5, :string
    add_column :works, :image6, :string
    add_column :works, :image7, :string
    add_column :works, :image8, :string
    add_column :works, :image9, :string
    add_column :works, :image10, :string
  end
end
