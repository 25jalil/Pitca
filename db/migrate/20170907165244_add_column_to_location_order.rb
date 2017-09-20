class AddColumnToLocationOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :store, foreign_key: true
    add_column :orders, :recipient_adress, :string 
    add_column :orders, :sender_coordinates,    :string, array: true, default: [] 
    add_column :orders, :recipient_coordinates, :string, array: true, default: []
  end
end
