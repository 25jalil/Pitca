class Cart < ApplicationRecord
  belongs_to :store
  has_many   :ordered_products
  has_one    :order

  validates_associated :ordered_products
end
