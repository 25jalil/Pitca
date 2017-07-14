class Store < ApplicationRecord

  has_many :products, dependent: :destroy
  has_many :ordered_products, dependent: :destroy

  validates :company, presence: true, length: { maximum: 40}, uniqueness: true
  validates :address, presence: true

  validates_associated :products
  validates_associated :ordered_products
end
