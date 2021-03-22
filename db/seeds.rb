# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  Label.create!(name: "label#{i + 1}")
end

10.times do |i|
  User.create!(
    name: "user#{i + 1}",
    email: "user#{i + 1}@email.com",
    password: "user#{i + 1}user#{i + 1}",
    password_confirmation: "user#{i + 1}user#{i + 1}",
    admin: false
  )
end


10.times do |i|
  Task.create!(
    title: "task#{i + 1}",
    content: "task#{i + 1}",
    user_id: User.find(i + 1).id
  )
end

User.create!(
  name:  "管理者",
  email: "admin@example.jp",
  password:  "11111111",
  password_confirmation: "11111111",
  admin: true
)
