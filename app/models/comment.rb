class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # contentカラムの入力を必須にする
  validates :content, presence: true
end
