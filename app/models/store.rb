class Store < ApplicationRecord

  has_one  :cart, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :carts, dependent: :destroy

  validates :company, presence: true, length: { maximum: 40}, uniqueness: true
  validates :address, presence: true

  validates_associated :products
end
