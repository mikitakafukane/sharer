FactoryBot.define do
  factory :chat do
    content { Faker::Lorem.characters(number: 5) }
    user
    room
  end
end