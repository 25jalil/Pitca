class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :menu_date
      t.belongs_to :user
      t.belongs_to :store
      t.timestamps
    end
  end
end
