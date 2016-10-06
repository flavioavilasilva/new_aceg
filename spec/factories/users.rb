FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    name 'Jailson'
    state 'SP'
    city 'São paulo'
    phone '4004-1156'
    address 'Rua da esperanca'
  end
end
