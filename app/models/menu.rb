class Menu < ApplicationRecord
  has_and_belongs_to_many :products, dependent: :destroy
  belongs_to :user
  belongs_to :store
  validates_associated :products
  validates :menu_date, uniqueness: true
end
