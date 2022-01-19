class PostsController < ApplicationController
  def index; end

  def show; end

  def new
    post = Post.new
    @current_user = current_user
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end
end
