FactoryBot.define do
  factory :post do
    content { "test-content" }
    association :owner
  end
end
