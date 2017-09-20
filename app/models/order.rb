class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :store
  
  serialize :order_info

  scope :all_orders_user, -> (user) do
    select("order_info")
    .where("user_id = ?", user)
  end
end