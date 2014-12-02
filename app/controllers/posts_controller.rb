class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:error] = "Something went wrong.  Please try again."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(posts_params)
      redirect_to post_path
    else
      flash[:error] = "Something went wrong.  Please try again."
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :body)
  end
end
