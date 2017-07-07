class Pizza < ApplicationRecord
  belongs_to :store
  has_many :line_items, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30}
  validates :description, presence: true, length: { maximum: 200}
  validates :price, presence:true, numericality: {only_float: true}
  validates_associated :line_items
end
