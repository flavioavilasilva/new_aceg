FactoryGirl.define do
  factory :ong do
  sequence :name do |n|
    "ong - #{n}"
  end
  location 'Diadema'
  phone '12345678'
  mail 'od@gmail.com'
  site 'od.com.br'
  end
end
