FactoryGirl.define do
  factory :address do
    postal_code Faker::Address.postcode
    latitude -23.6833585
    longitude -46.7144426
    state Faker::Address.state
    city Faker::Address.city
    address Faker::Address.street_name
    address_number "186"
  end
end
