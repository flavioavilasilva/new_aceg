class Ong < ApplicationRecord
  has_many :pets
  has_many :events
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                             default_url: '/images/:style/missing_ong.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\z}

  validates :cnpj, :name, :street, :number, :neighborhood, :zipcode, :state,
            :city, :email, :phone, :contact, presence: true
  def featured_pets
    pets.order(:created_at).limit(5)
  end
end
