class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index]

  # 1ページの表示数
  PER_PAGE = 1

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user, :likes).order(created_at: :desc).page(params[:page]).per(PER_PAGE)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
    gon.chart_data = @post.post_valuation
  end

  def new
    @post = Post.new
    @post.build_post_valuation
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: t(".notice")
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: t(".notice")
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to root_path, alert: t(".alert")
  end

  private

  def set_post
    # 自分の投稿のみ編集、削除ができるようにする
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_path, alert: t(".alert") if @post.nil?
  end

  def post_params
    params.require(:post).permit(:title, :recommend_point, :situation, :area, :recommend_image, :address, :latitude, :longitude,
                                 post_valuation_attributes: [:access_point, :casually_point, :price_point, :go_to_again_point, :one_person_point, :_destroy])
  end
end
