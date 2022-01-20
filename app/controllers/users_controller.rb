class UsersController < ApplicationController
  def index
    @posts = @user.posts.includes(:comments)
  end

  def show; end
end
