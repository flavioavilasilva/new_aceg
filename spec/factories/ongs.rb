FactoryGirl.define do
  factory :ong do
    sequence :name do |n|
      "ong - #{n}"
    end
    phone '12345678'
    site 'od.com.br'
    cnpj '325256462'
    address 'Rua de baixo 123'
    email 'od@gmail.com'
    contact 'edson...'
    about_us 'bla.. bla'
    logo 'imagemLogo'
    acept_pets 1
  end
end
