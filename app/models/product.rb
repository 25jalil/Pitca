class Product < ApplicationRecord
  attachment :product_image

  belongs_to :store

  validates  :name, presence: true, length: { maximum: 30}
  validates  :description, presence: true, length: { maximum: 500}
  validates  :price, presence:true, numericality: {only_float: true}
end
