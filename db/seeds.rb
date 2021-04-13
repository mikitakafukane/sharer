# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do |n|
  User.create!(
    name:       "テストユーザー#{n + 1}",
    email:      "user#{n + 1}@test.com",
    password:   "usertest",
    image_id:   File.open("./app/assets/images/no_image.jpg"),
    belonging:  "20210#{n + 1}",
    is_deleted: "false"
  )
end

4.times do |n|
  Post.create!(
    user_id: n + 1,
    content: "これは例です#{n + 1}"
  )
end
