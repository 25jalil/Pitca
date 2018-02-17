class MenusProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :menus_products do |t|
      t.belongs_to :menu, index: true
      t.belongs_to :product, index: true 
    end 
  end
end
