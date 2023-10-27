class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.includes(posts: %i[comments user]).find(params[:id])
    @posts = @user.recent_posts
  end
end
