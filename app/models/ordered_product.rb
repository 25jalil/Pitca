class OrderedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :store
  belongs_to :cart
  belongs_to :user
end
