FactoryGirl.define do
  factory :pet do
    name { Faker::Name.first_name }
    ong
    avatar { File.new("#{Rails.root}/spec/support/fixtures/image.jpg") }
    age 1
    size 'Grande'
    pet_type 'Cachorro'
    breed 'SRD'
    gender 'Macho'
    vaccined false
    deficiency 'Nenhuma'
    castrated true
    description 'Muito docil e fofo'
  end
end
