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
    if @post.save
      flash[:notice] = 'Post created successfully'
    else
      flash[:error] = "Couldn't create post"
    end
    redirect_to user_posts_path
  end

  def like
    @post = Post.all.find(params[:id])
    @like = Like.new(author: current_user.id, post_id: @post.id)
    if @like.save
      flash[:notice] = 'Post liked successfully'
    else
      flash[:error] = "Couldn't like the post"
    end
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path
  end
end
