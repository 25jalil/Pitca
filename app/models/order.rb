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

  scope :sum_orders, -> (store_id) do
    select("date(created_at) as created_at, sum(total_price) as total_price").where(store_id: store_id).group("date(created_at)")
  end
end