class CreateOrderedProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :ordered_products do |t|
      t.integer :quantity
      t.belongs_to :product, index: true
      t.belongs_to :store, index: true
      t.belongs_to :cart, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
