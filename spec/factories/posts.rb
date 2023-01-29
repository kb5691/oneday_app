FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    recommend_point { Faker::Name.name }
    situation { Faker::Food.dish }
    area { Faker::Address.city }
    user
  end
end
