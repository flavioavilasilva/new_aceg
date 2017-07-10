class Adoption < ApplicationRecord
  belongs_to :ong
  belongs_to :user
  belongs_to :pet
  validates :pet, :user, :status, presence: true

  enum status: { Solicitada: 0, Rejeitada: 1, Aprovada: 2, Cancelada: 3 }
end
