class Order < ApplicationRecord
  belongs_to :user, optional: true
  serialize :order_info
end
