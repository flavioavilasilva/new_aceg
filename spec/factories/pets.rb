FactoryGirl.define do
  factory :pet do
    name 'Bob'
    avatar { File.new("#{Rails.root}/spec/support/fixtures/image.jpg") }
    age 1
    size 'Grande'
    pet_type 'MyString'
    breed 'MyString'
    gender 'MyString'
    vaccined false
    deficiency 'MyText'
    castrated false
    description 'MyText'
  end
end
