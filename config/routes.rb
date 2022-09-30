Rails.application.routes.draw do
  root to: "posts#index"
  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  # ログイン機能
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  # ゲストログイン
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
