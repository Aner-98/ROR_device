class AddImageToGalleries < ActiveRecord::Migration[5.1]
  def change
    add_column :galleries, :image, :string
  end
end
