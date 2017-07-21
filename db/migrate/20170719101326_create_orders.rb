class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user 
      t.integer    :product_id
      t.string     :product_name
      t.float      :product_price
      t.integer    :product_quantity
      t.boolean    :rendition, default: false
      t.timestamps
    end
  end
end
