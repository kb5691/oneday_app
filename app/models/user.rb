class User < ApplicationRecord
  # userが複数のpostを持つように設定し、ユーザーが削除されたら投稿も削除される
  has_many :posts, dependent: :destroy
  # userが複数のlikeを持つように設定し、ユーザーが削除されたらいいねも削除される
  has_many :likes, dependent: :destroy
  # userが複数のcommentを持つように設定し、ユーザーが削除されたらコメントも削除される
  has_many :comments, dependent: :destroy
  # userが「いいね」している投稿一覧を取得できるように設定
  has_many :liked_posts, through: :likes, source: :post
  # プロフィール画像
  mount_uploader :profile_image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 名前を入力必須、文字数制限
  validates :name, presence: true, length: { maximum: 30 }
  # 住所、行きたい場所、好きなシチュエーションは文字数制限
  validates :address, length: { maximum: 30 }
  validates :go_to_area, length: { maximum: 30 }
  validates :like_situation, length: { maximum: 30 }
  # ゲストアカウントを取得する
  def self.guest
    find_or_create_by!(email: "guest@example.com", address: "東京都", go_to_area: "沖縄県", like_situation: "自然") do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
