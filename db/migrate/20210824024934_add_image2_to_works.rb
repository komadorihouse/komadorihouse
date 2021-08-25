class AddImage2ToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :image2, :string
  end
end
