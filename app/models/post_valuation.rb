class PostValuation < ApplicationRecord
  # post_valuationは1つのpostに所属する
  belongs_to :post
  # 以下のカラムを入力必須にする
  validates :access_point, presence: true
  validates :casually_point, presence: true
  validates :price_point, presence: true
  validates :go_to_again_point, presence: true
  validates :one_person_point, presence: true
end
