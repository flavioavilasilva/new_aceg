class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :ongs
  has_many :adoptions

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.email = auth.info.email
      user.uid = auth.uid
      user.provider = auth.provider
      user.image = auth.info.image
      user.save!
    end
  end
end
