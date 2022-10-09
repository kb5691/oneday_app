class ApplicationController < ActionController::Base
  # 全ページのログインを必須にする
  before_action :authenticate_user!
  # 新規登録でユーザー名も登録できるように設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # 新規登録
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # 編集
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_image, :address, :go_to_area, :like_situation])
  end
end
