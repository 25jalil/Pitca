class AddUserIdToOrderProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products_orders, :user, index: true
  end
end
