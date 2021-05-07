FactoryBot.define do
  factory :task do
    title { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.characters(number: 10) }
    status { '未完了' }
    user
  end
end