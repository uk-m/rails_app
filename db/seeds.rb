User.create!(name: "Example User",
             email: "example@mail",
             password: "password",
             password_confirmation: "password",
             admin: true)
             
50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@mail"
  password = "password"
  User.create!(user_id: n+1,
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
  { tag_id: 1, name: '家電' },
  { tag_id: 2, name: 'パソコン' },
  { tag_id: 3, name: 'カメラ' },
  { tag_id: 4, name: 'スマートフォン' },
  { tag_id: 5, name: '生活' },
  { tag_id: 6, name: 'ファッション' },
  { tag_id: 7, name: '小物' },
  { tag_id: 8, name: '趣味' },
  { tag_id: 9, name: 'キッチン' },
  { tag_id: 10, name: 'インテリア' },
  { tag_id: 11, name: 'ゲーム' },
  { tag_id: 12, name: 'ペット' },
  { tag_id: 13, name: '植物' }
  ])