class Adoption < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  validates :pet, :user, :status, presence: true
end
