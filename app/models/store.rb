class Store < ApplicationRecord

  has_one :ordered_product, dependent: :destroy
  has_many :products, dependent: :destroy
  belongs_to :user

  validates :company, presence: true, length: { maximum: 40}, uniqueness: true
  validates :address, presence: true

  validates_associated :ordered_product
  validates_associated :products
end
