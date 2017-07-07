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

  def featured_pets
    available_pets.limit(4)
  end

  def available_pets
    pets.where(available: true).order("created_at ASC")
  end

  def featured_events
    events.order(:created_at).limit(4)
  end
end
