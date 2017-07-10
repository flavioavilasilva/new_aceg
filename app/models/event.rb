class Event < ApplicationRecord
  belongs_to :ong
  validates :name, :address, :datetime, presence: true

  def self.home_events
    all.limit(4)
  end
end
