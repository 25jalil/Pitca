class Order < ApplicationRecord
  has_many :products_orders, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :store

  scope :all_orders_user, -> (user) do
    select("products_info")
    .where("user_id = ?", user)
  end

  scope :not_executed_orders, -> (user) do
    where("rendition = ? AND user_id = ?", false, user)
  end

  scope :executed_orders, -> (user) do
    where("rendition = ? AND user_id = ?", true, user)
  end
end