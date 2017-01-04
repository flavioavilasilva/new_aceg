class Address < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  belongs_to :ong
  belongs_to :user
end
