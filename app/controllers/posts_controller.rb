class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.any { render json: @post }
    end
  end

  def index
    @posts = Post.where(project_id: params[:project_id])
    respond_to do |format|
      format.any { render json: @posts }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    respond_to do |format|
      format.any { render json: @post }
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    respond_to do |format|
      format.any { render json: @post }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
