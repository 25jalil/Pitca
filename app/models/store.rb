class Store < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :user
  
  validates :company, presence: true, length: { maximum: 40}, uniqueness: true
  validates :address, presence: true
  validates_associated :products

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  after_validation :latitude , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  after_validation :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
end
