class AddProductImageToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :product_image_id, :string
  end
end
