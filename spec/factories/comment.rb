FactoryBot.define do
  factory :comment do
    content { "コメント" }
    user
    post
  end
end
