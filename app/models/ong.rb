class Ong < ApplicationRecord
  has_many :pets

  validates :cnpj, :name, :street, :number, :neighborhood, :zipcode, :state,
            :city, :email, :phone, :contact, presence: true
  def featured_pets
    pets.order(:created_at).limit(5)
  end
end
