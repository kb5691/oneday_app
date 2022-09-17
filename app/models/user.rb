class User < ApplicationRecord
  # userが複数のpostを持つように設定し、ユーザーが削除されたら投稿も削除される
  has_many :posts, dependent: :destroy
  # userが複数のlikeを持つように設定し、ユーザーが削除されたらいいねも削除される
  has_many :likes, dependent: :destroy
  # userが複数のcommentを持つように設定し、ユーザーが削除されたらコメントも削除される
  has_many :comments, dependent: :destroy
  # userが「いいね」しているメッセージの一覧を取得できるように設定
  has_many :liked_posts, through: :likes, source: :post
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
