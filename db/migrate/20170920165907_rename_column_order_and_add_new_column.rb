class RenameColumnOrderAndAddNewColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column :orders, :order_info, :products_info
  	add_column :orders, :shipping, :float
  	add_column :orders, :total_price, :float
  end
end
