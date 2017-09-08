class Order < ApplicationRecord
  
  belongs_to :user, optional: true
  serialize :order_info
 
  geocoded_by :recipient_adress, :latitude  => :recipient_latitude, :longitude => :recipient_longitude
  after_validation :geocode, if: ->(obj){ obj.recipient_adress.present?}
end