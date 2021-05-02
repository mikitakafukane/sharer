FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    belonging { Faker::Lorem.characters(number: 5) }
    # association :user
  end
  
  factory :room do
    name { Faker::Lorem.characters(number:10) }
    # body { Faker::Lorem.characters(number:30) }
    # association :user
  end
end