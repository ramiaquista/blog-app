class PostsController < ApplicationController
  def index
    id = params[:user_id]
    @user = User.find(id)
    @posts = Post.includes(:author).where("user_id = #{id}").references(:user).order(id: :desc)
  end

  def show
    post_id = params[:id]
    @post = Post.find(post_id)
    @user = User.find(@post.user_id)
    @comments = Comment.includes(:post).where("post_id = #{post_id}").references(:post)
  end

  def new
    @new_post = Post.new
    @current_user = User.find(params[:user_id])
  end

  def create
    @current_user = User.find(params[:user_id])
    returned_values = post_params
    @new_post = @current_user.post.create(returned_values)
    redirect_to user_posts_path
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter, :user_id, :author_id)
  end
end
