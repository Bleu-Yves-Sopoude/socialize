class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    logger.debug(params)
    @user = current_user
    @post = @user.posts.find(params[:id])
    @comments = @post.comments
  end

  def new
    @user = current_user
    @post = Post.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to user_posts_path(id: current_user.id)
    else
      flash.now[:alert] = 'Cannot create a new post'
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
