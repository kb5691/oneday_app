class PostsController < ApplicationController
  def index
    @posts = Post.order(:created_at)
  end

  def show; end

  def new
    @post = Post.new
    @post_valuation = @post.post_valuations.new
  end

  def create
    Post.create!(post_params)
    redirect_to post
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def post_params
    params.require(:post).permit(:title, :recommend_point, :situation, :area, :recommend_image,
                                 post_valuations_attributes: [:access_point, :casually_point, :price_point, :go_to_again_point, :one_person_point])
  end
end
