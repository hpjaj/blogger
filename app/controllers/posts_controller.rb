class PostsController < ApplicationController
  def index
    @posts = Post.all.most_recently_created.paginate(page: params[:page], per_page: 5)
    @all_posts = Post.all.most_recently_created
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to root_path
    else
      flash[:error] = "Something went wrong.  Please try again."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @all_posts = Post.all.most_recently_created
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
