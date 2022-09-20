class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.order(updated_at: :desc)
  end

  def show; end

  def new
    @post = Post.new
    @post.build_post_valuation
  end

  def create
    post = current_user.posts.create!(post_params)
    redirect_to post
  end

  def edit; end

  def update
    @post.update!(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy!
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :recommend_point, :situation, :area, :recommend_image,
                                 post_valuation_attributes: [:access_point, :casually_point, :price_point, :go_to_again_point, :one_person_point, :_destroy])
  end
end
