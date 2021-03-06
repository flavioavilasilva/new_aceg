class Address < ApplicationRecord
  has_many :users
  has_one :ong
  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  validates :postal_code, :state, :city, :address, :address_number, :neighborhood, presence: true
end
