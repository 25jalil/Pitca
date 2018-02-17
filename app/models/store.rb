class Store < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :orders
  has_many :menus
  
  belongs_to :user
  
  validates :company, presence: true, length: { maximum: 40}, uniqueness: true
  validates :address, presence: true
  validates_associated :products

  geocoded_by :address
  after_validation :geocode
end
