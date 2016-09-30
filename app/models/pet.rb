class Pet < ApplicationRecord
  belongs_to :ong
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                             default_url: '/images/:style/missing.jpg'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\z}
  validates :name, :size, :pet_type, :gender, presence: true
end
