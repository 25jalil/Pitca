class Cart < ApplicationRecord
  has_many   :ordered_products, dependent: :destroy
  has_one    :order

  validates_associated :ordered_products
end
