class CreateProductsOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :products_orders do |t|
      t.string :product_name
      t.float :product_price
      t.integer :amount
      t.references :order
      t.timestamps
    end
  end
end
