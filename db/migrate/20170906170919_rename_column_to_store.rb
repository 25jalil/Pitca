class RenameColumnToStore < ActiveRecord::Migration[5.1]
  def change
    rename_column :stores, :price_per_km, :cost_of_shipping
  end
end
