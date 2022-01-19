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

  def create
    @post = Post.new(params[:post].permit(:title, :text))
    @post.save
    redirect_to user_posts_path
  end

  def like
    @post = Post.all.find(params[:id])
    Like.create(author: current_user.id, post_id: @post.id)
    redirect_to post_path(@post)
  end
end
