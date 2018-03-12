class AddIndexToMenusProducts < ActiveRecord::Migration[5.1]
  def change
    add_index :menus_products, %i[menu_id product_id], unique: true
  end
end
