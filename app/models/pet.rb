class Pet < ApplicationRecord
  belongs_to :ong
  has_many :adoptions
  has_many :photos
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                             default_url: '/images/:style/missing_pet.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\z}
  validates :name, :size, :pet_type, :gender, presence: true

  after_create :save_photos
  after_update :save_photos

  def photos=(value)
    @photos=value
  end

  private

  def save_photos
    return if @photos.nil?
    @photos.each do |photo_image|
      Photo.create(pet_id: self.id, image: photo_image)
    end
  end
end
