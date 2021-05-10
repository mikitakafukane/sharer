FactoryBot.define do
  factory :event do
    title { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.characters(number: 10) }
    start_date { Time.now }
    end_date { Time.now }
    user
  end
end