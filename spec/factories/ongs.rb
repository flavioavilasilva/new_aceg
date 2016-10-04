FactoryGirl.define do
  factory :ong do
    sequence :name do |n|
      "ong - #{n}"
    end
    phone '12345678'
    cnpj '1241412'
    site 'od.com.br'
    email 'od@gmail.com'
    contact 'edson...'
    about_us 'bla.. bla'
    logo 'imagemLogo'
    acept_pets 1
    city 'Diadema'
    state 'Sao Paulo'
    street 'Rua aurora'
    number 15
    neighborhood 'Santo Amaro'
    zipcode '12345-123'

  end
end
