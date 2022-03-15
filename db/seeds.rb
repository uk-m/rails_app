User.create!(name: "Example User",
             email: "example@mail",
             password: "password",
             password_confirmation: "password",
             admin: true)
             
50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@mail"
  password = "password"
  User.create!(name: name,
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

Tag.create([
  { name: '家電' },
  { name: 'パソコン' },
  { name: 'カメラ' },
  { name: 'スマートフォン' },
  { name: '生活' },
  { name: 'ファッション' },
  { name: '小物' },
  { name: '趣味' },
  { name: 'キッチン' },
  { name: 'インテリア' },
  { name: 'ゲーム' },
  { name: 'ペット' },
  { name: '植物' }
  ])