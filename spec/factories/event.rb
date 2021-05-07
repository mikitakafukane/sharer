FactoryBot.define do
  factory :event do
    title { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.characters(number: 10) }
    start_date { '2021-05-18 18:00:00' }
    start_date { '2021-05-18 21:00:00' }
    user
  end
end