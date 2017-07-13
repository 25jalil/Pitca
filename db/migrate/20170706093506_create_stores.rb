class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :company
      t.text :address
      t.timestamps
    end
  end
end
