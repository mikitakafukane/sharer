# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 4.times do |n|
#   User.create!(
#     name:       "テストユーザー#{n + 1}",
#     email:      "user#{n + 1}@test.com",
#     password:   "usertest",
#     belonging:  "20210#{n + 1}"
#   )
# end

User.create!(
  name:       "テストユーザー",
  email:      "test@test.com",
  password:   "testtest",
  belonging:  "202102",
  current_sign_in_at: Time.now
  )
  
User.create!(
  name:       "深根　幹貴",
  email:      "fukane@test.com",
  password:   "testtest",
  belonging:  "202102",
  current_sign_in_at: Time.now
  )

User.create!(
  name:       "チャ　タン",
  email:      "chatan@test.com",
  password:   "testtest",
  belonging:  "202102",
  current_sign_in_at: Time.now
  )
  
User.create!(
  name:       "亀崎　bootstrap　瑞希",
  email:      "kamezaki@test.com",
  password:   "testtest",
  belonging:  "202102",
  current_sign_in_at: Time.now
  )
  
User.create!(
  name:       "フェニックス　一輝",
  email:      "nozaki@test.com",
  password:   "testtest",
  belonging:  "202102",
  current_sign_in_at: Time.now
  )
  
User.create!(
  name:       "サヨ　ティン",
  email:      "sayothin@test.com",
  password:   "testtest",
  belonging:  "202102",
  current_sign_in_at: Time.now
  )
  
6.times do |n|
  Post.create!(
    user_id: n + 1,
    content: "テスト#{n + 1}"
  )
end

6.times do |n|
  Task.create!(
    user_id: n + 1,
    title: "テスト#{n + 1}",
    status: "未完了"
  )
end

# Room.create!(name: 'A')
# Room.create!(name: 'B')
# Room.create!(name: 'C')


