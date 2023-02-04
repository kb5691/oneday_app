class UsersController < ApplicationController
  # 1ページの表示数
  PER_PAGE = 5

  def show
    if current_user.id == params[:id]
      my_page
    else
      user_info_page
    end
  end

  private

  def my_page
    @user = current_user
    @posts = Post.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(PER_PAGE)
  end

  def user_info_page
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(PER_PAGE)
  end
end
