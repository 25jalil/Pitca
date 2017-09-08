class AddColumnToLocationOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :recipient_adress,    :string
    add_column :orders, :recipient_latitude,  :float, null: false
    add_column :orders, :recipient_longitude, :float, null: false
  end
end
