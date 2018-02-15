class AddMenuDateToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :menu_date, :string 
  end
end
