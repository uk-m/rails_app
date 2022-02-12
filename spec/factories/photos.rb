FactoryBot.define do
  factory :photo do
    association :post
    user { post.owner }
  end
end
