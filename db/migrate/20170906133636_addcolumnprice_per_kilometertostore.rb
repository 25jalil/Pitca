class AddcolumnpricePerKilometertostore < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :price_per_km, :float, null: false
  end
end
