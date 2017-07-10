class Product < ApplicationRecord
  belongs_to :store
  has_many   :ordered_products, dependent: :destroy
  has_many :orders, through: :ordered_products

  validates :name, presence: true, length: { maximum: 30}
  validates :description, presence: true, length: { maximum: 200}
  validates :price, presence:true, numericality: {only_float: true}
  validates_associated :ordered_products
end
