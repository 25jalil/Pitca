class RemoveColumnToOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :product_id
    remove_column :orders, :product_name
    remove_column :orders, :product_price
    remove_column :orders, :product_quantity
    remove_column :orders, :rendition
    remove_column :orders, :created_at
    remove_column :orders, :updated_at
  end
end
