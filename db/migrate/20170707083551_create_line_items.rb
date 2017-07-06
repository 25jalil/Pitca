class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.belongs_to :store, index: true
      t.belongs_to :pizza, index: true
      t.belongs_to :cart, index: true
      t.timestamps
    end
  end
end
