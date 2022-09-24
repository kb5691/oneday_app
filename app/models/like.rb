class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_count
  # user_id, post_idの組が一意になるように設定
  validates :user_id, uniqueness: {
    scope: :post_id,
    message: :duplicated
  }
end
