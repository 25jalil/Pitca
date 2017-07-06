class Pizza < ApplicationRecord
  belongs_to :store
  has_many :line_items
end
