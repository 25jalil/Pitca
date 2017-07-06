class LineItem < ApplicationRecord
  belongs_to :store
  belongs_to :pizza
  belongs_to :cart
end
