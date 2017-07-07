class Store < ApplicationRecord

  has_one :line_item, dependent: :destroy
  has_many :pizzas, dependent: :destroy
  belongs_to :user

  validates :company, presence: true, length: { maximum: 40}, uniqueness: true
  validates :address, presence: true

  validates_associated :line_item
  validates_associated :pizzas
end
