class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :adoptions
  belongs_to :address

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]

  accepts_nested_attributes_for :address

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                             default_url: '/images/:style/missing_ong.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\z}

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.password = Devise.friendly_token[0,20]
      #user.avatar = auth.info.image.gsub("http","https")
      user.name = auth.info.name
      user.email = auth.info.email
      user.uid = auth.uid
      user.provider = auth.provider
      user.facebook_url = auth.info.urls['Facebook'].remove("https://")
      user.address = Address.new(city: (auth.info.location.split ',')[0])
      user.save!
    end
  end
end
