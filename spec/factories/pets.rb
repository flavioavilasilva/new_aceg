FactoryGirl.define do
  factory :pet do
    name "MyString"
    age 1
    size 'Grande'
    pet_type "MyString"
    breed "MyString"
    gender "MyString"
    vaccined false
    deficiency "MyText"
    castrated false
    description "MyText"
  end
end
