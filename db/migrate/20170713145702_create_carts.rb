class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.belongs_to :store, index: true
      t.timestamps
    end
  end
end
