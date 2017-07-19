class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :reserve_quantity, null: false, default: 1
      t.float :price
      t.belongs_to :store, index: true
      t.timestamps
    end
  end
end
