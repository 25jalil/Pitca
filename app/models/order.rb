class Order < ApplicationRecord
  has_many :ordered_products
  validates_associated :ordered_products
end
