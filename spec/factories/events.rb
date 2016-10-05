FactoryGirl.define do
  factory :event do
    name { Faker::Lorem.sentence(3) }
    address { Faker::Address.street_address }
    datetime { Faker::Date.between(1.month.ago, Time.zone.today) }
  end
end
