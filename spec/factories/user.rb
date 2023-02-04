FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { "password" }
    address { Faker::Address.city }
    go_to_area { Faker::Address.city }
    like_situation { "自然" }
  end
end
