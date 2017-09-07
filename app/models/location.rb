class Location < ApplicationRecord
  belongs_to :located, :polymorphic => true
  geocoded_by :address
  after_validation :geocode
end
