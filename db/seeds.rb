User.create!(name: "Example User",
             email: "example@mail",
             password: "password",
             password_confirmation: "password",
             admin: true)
             
50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@mail"
  password = "password"
  User.create!(id: n+1,
               name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

Tag.create!([
  { id: 1, name: '家電' },
  { id: 2, name: 'パソコン' },
  { id: 3, name: 'カメラ' },
  { id: 4, name: 'スマートフォン' },
  { id: 5, name: '生活' },
  { id: 6, name: 'ファッション' },
  { id: 7, name: '小物' },
  { id: 8, name: '趣味' },
  { id: 9, name: 'キッチン' },
  { id: 10, name: 'インテリア' },
  { id: 11, name: 'ゲーム' },
  { id: 12, name: 'ペット' },
  { id: 13, name: '植物' }
  ])