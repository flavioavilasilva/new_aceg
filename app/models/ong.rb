class Ong < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :pets
  has_many :events
  has_many :adoptions
  belongs_to :address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  accepts_nested_attributes_for :address

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                             default_url: '/images/:style/missing_ong.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\z}

  validates :name, :email, :phone, :address, presence: true

  scope :city, -> (city) { where(addresses: { city: city } ) }
  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}

  def featured_pets
    available_pets.limit(4)
  end

  def available_pets
    pets.where(available: true).order("created_at ASC")
  end

  def featured_events
    events.order(:created_at).limit(4)
  end

  def estimate_dogs_food_month
    media_pequenos =  0.101 * pets.where(size: 'Pequeno').count
    media_medios   =  0.261 * pets.where(size: 'Médio').count
    media_grandes  =  0.354 * pets.where(size: 'Grande').count

    media_total = (media_pequenos + media_medios + media_grandes) * 30
    media_total.to_s + " Kg de ração por mês"
  end
end
