FactoryGirl.define do
  factory :ong do
    sequence :name do |n|
      "ong - #{n}"
    end
    phone '12345678'
    cnpj '1241412'
    password '123456'
    site 'od.com.br'
    email { Faker::Internet.email }
    contact 'edson...'
    about_us 'bla.. bla'
    logo 'imagemLogo'
    acept_pets 1
    description 'Great ong...'
    address { FactoryGirl.create(:address) }
  end
end
