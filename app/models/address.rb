class Address < ApplicationRecord
  has_one :user
  has_one :ong
  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
end
