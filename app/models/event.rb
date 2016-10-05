class Event < ApplicationRecord
  belongs_to :ong
  validates :name, :address, :datetime, presence: true
end
