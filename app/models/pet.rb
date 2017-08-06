class Pet < ApplicationRecord
  belongs_to :ong
  has_one :age
  has_many :adoptions
  has_many :photos
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                             default_url: '/images/:style/missing_pet.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\z}

  validates :name, :size, :pet_type, :gender, presence: true
  validates_associated :age, presence: true

  after_create :save_photos, :save_age
  after_update :save_photos, :save_age

  scope :city, -> (city) { where(addresses: { city: city } ) }
  scope :type, -> (type) { where(pet_type: type ) }
  scope :gender, -> (gender) { where(gender: gender ) }
  scope :size_pet, -> (size_pet) { where(size: size_pet ) }

  def photos=(value)
    @photos=value
  end

  def age=(value)
    @age=value
  end

  def available
    available? ? 'Disponível para adoção' : 'Indisponível para adoção'
  end

  def castrated
    castrated? ? 'Castrado' : 'Não castrado'
  end

  private

  def save_photos
    return if @photos.nil?
    @photos.each do |photo_image|
      Photo.create(pet_id: self.id, image: photo_image)
    end
  end

  def save_age
    return if @age.nil?
    pet_age = Age.where(pet_id: self.id).first
    if pet_age.nil?
      Age.save(pet_id: self.id, age: @age['age'], scala: @age['scala'])
    else
      pet_age.update(age: @age['age'], scala: @age['scala'])
    end
  end
end
