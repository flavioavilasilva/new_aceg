class Ong < ApplicationRecord
  has_many :pets

  def featured_pets
    pets.order(:created_at).limit(5)
  end
end
