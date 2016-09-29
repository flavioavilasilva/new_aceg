class PetsController <  ApplicationController
  def new
    @sizes = Size::SIZES
    @pet_types = PetType::TYPES
    @genders = Gender::GENDERS
    @pet = Pet.new
  end
end
