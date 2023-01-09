# ログイン時に使用する「メールアドレス」と「パスワード」
email = "test@example.com"
password = "password"

# users テーブルを再生成（関連付いたテーブルを含む）
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")

# ユーザー
user1 = User.create!(name: "satou", email: "satou@example.com", password: "password", address: "北海道", go_to_area: "沖縄県", like_situation: "自然")
user2 = User.create!(name: "suzuki", email: "suzuki@example.com", password: "password", address: "青森県", go_to_area: "徳島県", like_situation: "食べ歩き")
user3 = User.create!(name: "araki", email: "araki@example.com", password: "password", address: "新潟県", go_to_area: "香川県", like_situation: "景色")
user4 = User.create!(name: "tanaka", email: "tanaka@example.com", password: "password", address: "東京都", go_to_area: "福岡県", like_situation: "自然")
user5 = User.create!(name: "takahashi", email: "takahashi@example.com", password: "password", address: "千葉県", go_to_area: "兵庫県", like_situation: "自然")
user6 = User.create!(name: "ito", email: "ito@example.com", password: "password", address: "神奈川県", go_to_area: "鳥取県", like_situation: "食べ歩き")
user7 = User.create!(name: "watanabe", email: "watanabe@example.com", password: "password", address: "埼玉県", go_to_area: "沖縄県", like_situation: "食べ歩き")
user8 = User.create!(name: "yamamoto", email: "yamamoto@example.com", password: "password", address: "徳島県", go_to_area: "東京都", like_situation: "景色")
user9 = User.create!(name: "nakamura", email: "nakamura@example.com", password: "password", address: "大阪府", go_to_area: "神奈川県", like_situation: "景色")
user10 = User.create!(name: "kobayashi", email: "kobayashi@example.com", password: "password", address: "沖縄県", go_to_area: "静岡県",
                      like_situation: "景色")

# 投稿
post1 = user1.posts.create!(title: "清水寺", recommend_point: "景色と街並みが素晴らしい", situation: "景色", area: "京都府", address: "清水寺")
post2 = user2.posts.create!(title: "浅草寺", recommend_point: "日本文化のよさを改めて知れる", situation: "景色", area: "東京都", address: "浅草寺")
post3 = user3.posts.create!(title: "伏見稲荷大社", recommend_point: "千本鳥居が美しい", situation: "景色", area: "京都府", address: "伏見稲荷大社")
post4 = user4.posts.create!(title: "金閣寺", recommend_point: "建物がキレイ", situation: "景色", area: "京都府", address: "金閣寺")
post5 = user5.posts.create!(title: "東京タワー", recommend_point: "高い！夜のライトアップがキレイ", situation: "景色", area: "東京都", address: "東京タワー")
post6 = user6.posts.create!(title: "ユニバ", recommend_point: "非日常を味わえる", situation: "エンタメ", area: "大阪府", address: "ユニバーサル・スタジオ・ジャパン")
post7 = user7.posts.create!(title: "東京スカイツリー", recommend_point: "高い！東京タワーと違ったよさがある", situation: "景色", area: "東京都", address: "東京スカイツリー")
post8 = user8.posts.create!(title: "横浜中華街", recommend_point: "食べ歩きを楽しめる", situation: "食べ歩き", area: "神奈川県", address: "横浜中華街")
post9 = user9.posts.create!(title: "横浜赤レンガ倉庫", recommend_point: "買い物や景色が楽しめる！", situation: "ショッピング", area: "神奈川県", address: "横浜赤レンガ倉庫")
post10 = user10.posts.create!(title: "国際通り", recommend_point: "買い物、沖縄の食べ物が楽しめる！", situation: "ショッピング", area: "沖縄県", address: "国際通り")

# 投稿に対しての評価
PostValuation.create!(access_point: 1, casually_point: 2, price_point: 3, go_to_again_point: 4, one_person_point: 5, post_id: post1.id)
PostValuation.create!(access_point: 2, casually_point: 2, price_point: 3, go_to_again_point: 4, one_person_point: 5, post_id: post2.id)
PostValuation.create!(access_point: 3, casually_point: 2, price_point: 3, go_to_again_point: 4, one_person_point: 5, post_id: post3.id)
PostValuation.create!(access_point: 1, casually_point: 1, price_point: 1, go_to_again_point: 1, one_person_point: 1, post_id: post4.id)
PostValuation.create!(access_point: 5, casually_point: 5, price_point: 5, go_to_again_point: 5, one_person_point: 5, post_id: post5.id)
PostValuation.create!(access_point: 3, casually_point: 3, price_point: 3, go_to_again_point: 3, one_person_point: 3, post_id: post6.id)
PostValuation.create!(access_point: 4, casually_point: 4, price_point: 4, go_to_again_point: 4, one_person_point: 4, post_id: post7.id)
PostValuation.create!(access_point: 2, casually_point: 2, price_point: 2, go_to_again_point: 2, one_person_point: 2, post_id: post8.id)
PostValuation.create!(access_point: 3, casually_point: 3, price_point: 1, go_to_again_point: 4, one_person_point: 5, post_id: post9.id)
PostValuation.create!(access_point: 3, casually_point: 3, price_point: 3, go_to_again_point: 4, one_person_point: 5, post_id: post10.id)

# いいね
post1.likes.create!(user_id: user2.id)
post1.likes.create!(user_id: user3.id)
post2.likes.create!(user_id: user3.id)
post3.likes.create!(user_id: user1.id)
post3.likes.create!(user_id: user2.id)
post3.likes.create!(user_id: user4.id)
post4.likes.create!(user_id: user5.id)
post5.likes.create!(user_id: user6.id)
post6.likes.create!(user_id: user7.id)
post7.likes.create!(user_id: user8.id)

# コメント
post1.comments.create!(user_id: user10.id, content: "景色が素敵ですね。行ってみたいです！")
post1.comments.create!(user_id: user1.id, content: "コメントありがとうございます。ぜひ行ってみてください！")
post2.comments.create!(user_id: user9.id, content: "東京でもこんなところがあるんですね。")
post3.comments.create!(user_id: user9.id, content: "すごい景色ですね！")
post3.comments.create!(user_id: user8.id, content: "鳥居の数がすごいです！")
post3.comments.create!(user_id: user7.id, content: "私も行ったことありますが、とてもよかったです。")
post4.comments.create!(user_id: user6.id, content: "光ってますねー！")
post5.comments.create!(user_id: user2.id, content: "東京タワー1度は行ってみたいです。")
post6.comments.create!(user_id: user3.id, content: "非日常を味わうにはとってもよさそうです！")
post7.comments.create!(user_id: user4.id, content: "東京タワーより高いので行ってみたい。")

# ログイン時に使用するアカウント
User.create!(name: "test", email: email, password: password)
