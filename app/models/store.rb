class Store < ApplicationRecord

  has_many :products, dependent: :destroy

  validates :company, presence: true, length: { maximum: 40}, uniqueness: true
  validates :address, presence: true

  validates_associated :products
  
end
