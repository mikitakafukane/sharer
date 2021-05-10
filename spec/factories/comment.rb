FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.characters(number: 5) }
    user
    post
  end
end