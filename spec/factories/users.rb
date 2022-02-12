FactoryBot.define do
  factory :user, aliases: [:owner] do
    name { "Taro Sato" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "tester-password" }
  end
end
