class PetPresenter
  attr_reader :pet

  def initialize(pet)
    @pet = pet
  end

  def facebook_text
    text = "#{pet.breed.downcase}, porte #{pet.size.downcase}"
    text.concat(", #{pet.age.age} #{pet.age.scala.downcase}") if pet.age.present?
    text.concat(". Contato no e-mail #{pet.ong.email}")
    text.concat(" ou no telefone #{pet.ong.phone}") if pet.ong.phone.present?
    text.concat(". #{pet.description.capitalize}.")
  end
end
