class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.boolean :executed, null: false, default: false
      t.belongs_to :cart, index: true
      t.timestamps
    end
  end
end
