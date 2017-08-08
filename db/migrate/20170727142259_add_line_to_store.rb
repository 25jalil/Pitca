class AddLineToStore < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :latitude,  :float, null: false 	
    add_column :stores, :longitude, :float, null: false 
  end
end
