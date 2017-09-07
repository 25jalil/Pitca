class AddHashToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :order_info, :text, null: false
  end
end
