FactoryBot.define do
  factory :post do
    title { "タイトル" }
    recommend_point { "おすすめポイント" }
    situation { "シチュエーション" }
    area { "エリア" }
    user
  end
end
