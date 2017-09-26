class AddColumnRenditionToProductsOrder < ActiveRecord::Migration[5.1]
  def change
  	add_column :products_orders, :rendition, :boolean
  end
end
