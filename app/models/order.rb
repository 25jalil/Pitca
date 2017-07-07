class Order < ApplicationRecord
  has_many :carts
  validates_associated :carts
end
