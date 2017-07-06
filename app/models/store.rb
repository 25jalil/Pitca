class Store < ApplicationRecord

  has_one :line_item
  has_many :pizzas
  belongs_to :user

  validates :company, presence: true, length: { maximum: 30}, uniqueness: true
  validates :address, presence: true
end
