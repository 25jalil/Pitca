class Product < ApplicationRecord
  attachment :product_image

  belongs_to :store
  has_and_belongs_to_many :menus

  validates  :name, presence: true, length: { maximum: 30 }
  validates  :description, presence: true, length: { maximum: 500 }
  validates  :price, presence:true, numericality: { only_float: true }
end
