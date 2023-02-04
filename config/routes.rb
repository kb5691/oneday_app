Rails.application.routes.draw do
  root to: "posts#index"
  # マイページ
  get "users/:id/profile", to: "users#show", as: "user_profile"
  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resource :users, only: :show
  # ログイン機能
  devise_for :users, controllers: {
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  # ゲストログイン
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
