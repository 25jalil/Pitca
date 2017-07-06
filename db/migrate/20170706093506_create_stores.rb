class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :company
      t.text :address
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
