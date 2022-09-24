# ログイン時に使用する「メールアドレス」と「パスワード」
email = "test@example.com"
password = "password"

# users テーブルを再生成（関連付いたテーブルを含む）
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")

# ユーザー
user1 = User.create!(name: "satou", email: "satou@example.com", password: "password")
user2 = User.create!(name: "suzuki", email: "suzuki@example.com", password: "password")
user3 = User.create!(name: "tanaka", email: "tanaka@example.com", password: "password")

# 投稿
post1 = user1.posts.create!(title: "東京タワー", recommend_point: "ライトアップが綺麗で迫力がある")
post2 = user2.posts.create!(title: "浅草寺", recommend_point: "日本文化のよさを改めて知れる", situation: "お寺")
post3 = user3.posts.create!(title: "横浜中華街", recommend_point: "食べ歩きを楽しめる", situation: "食べ歩き", area: "神奈川県")

# 投稿に対しての評価
PostValuation.create!(access_point: 1, casually_point: 2, price_point: 3, go_to_again_point: 4, one_person_point: 5, post_id: post1.id)
PostValuation.create!(access_point: 2, casually_point: 2, price_point: 3, go_to_again_point: 4, one_person_point: 5, post_id: post2.id)
PostValuation.create!(access_point: 3, casually_point: 2, price_point: 3, go_to_again_point: 4, one_person_point: 5, post_id: post3.id)

# いいね
post1.likes.create!(user_id: user2.id)
post1.likes.create!(user_id: user3.id)
post2.likes.create!(user_id: user3.id)
post3.likes.create!(user_id: user1.id)

# ログイン時に使用するアカウント
User.create!(name: "test", email: email, password: password)
