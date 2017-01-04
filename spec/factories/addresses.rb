FactoryGirl.define do
  factory :address do
    ong nil
    user nil
    zipcode Faker::Address.postcode
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
    state Faker::Address.state_abbr
    city Faker::Address.city
    address Faker::Address.street_name
    address_number nil
  end
end
