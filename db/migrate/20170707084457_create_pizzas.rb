class CreatePizzas < ActiveRecord::Migration[5.1]
  def change
    create_table :pizzas do |t|
      t.string :name
      t.text :description
      t.float :price
      t.belongs_to :store, index: true
      t.timestamps
    end
  end
end
