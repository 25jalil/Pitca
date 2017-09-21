class RemoveColumnPorductsInfo < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :products_info
  end
end
