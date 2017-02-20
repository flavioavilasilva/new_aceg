FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    name 'Jailson'
    phone '4004-1156'
    address { FactoryGirl.create(:address) }
  end
end
