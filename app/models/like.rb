class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_count
  # user_id, post_idの組が一意になるように設定
  validates :user_id, uniqueness: {
    scope: :post_id,
    message: :duplicated
  }
  # 自分の投稿に「いいね」できないように設定
  validate :forbid_to_owner

  private

  def forbid_to_owner
    errors.add(:base, :owner_forbidden) if user_id == post.user_id
  end
end
