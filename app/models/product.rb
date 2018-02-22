class Product < ApplicationRecord
  attachment :product_image

  belongs_to :store
  has_and_belongs_to_many :menus

  validates  :name, presence: true, length: { maximum: 30 }
  validates  :description, presence: true, length: { maximum: 500 }
  validates  :price, presence:true, numericality: { only_float: true }
  validates  :category, presence:true

  scope :products_menu, -> (menu_id) do 
  	find_by_sql("SELECT * FROM products INNER JOIN menus_products ON products.id = menus_products.product_id WHERE menus_products.menu_id = menu_id") 
  end
end
