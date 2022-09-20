class Post < ApplicationRecord
  # postは1人のユーザーに属する
  belongs_to :user
  # postは1つのpost_valuationを持つように設定し、postが削除されたらpost_valuationも削除される
  has_one :post_valuation, dependent: :destroy
  # postが複数のlikeを持つように設定し、postが削除されたらlikeも削除される
  has_many :likes, dependent: :destroy
  # postが複数のcommentを持つように設定し、postが削除されたらcommentも削除される
  has_many :comments, dependent: :destroy
  # postを「いいね」しているユーザーの一覧を取得できるように設定
  has_many :liked_users, through: :likes, source: :user
  # title, recommend_pointを入力必須にする、それ以外は文字数制限をする
  validates :title, presence: true, length: { maximum: 50 }
  validates :recommend_point, presence: true, length: { maximum: 500 }
  validates :situation, length: { maximum: 30 }
  validates :area, length: { maximum: 30 }
  # postモデルに関連したモデルのフィールドを作成できるようにする
  accepts_nested_attributes_for :post_valuation, allow_destroy: true
  # 画像投稿機能のImageUploaderとpostsテーブルのreccomentd_imageカラムを連携
  mount_uploader :recommend_image, ImageUploader

  # postをuserが「いいね」しているときはtrue, 「いいね」していないときはfalse
  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end
end
