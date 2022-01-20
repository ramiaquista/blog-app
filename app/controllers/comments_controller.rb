class CommentsController < ApplicationController
  def new
    comment = Comment.new
    @current_user = current_user
    respond_to do |format|
      format.html { render :new, locals: { comment: comment } }
    end
  end

  def create
    @comment = Comment.new(params[:comment].permit(:text))
    @comment.save
    flash[:notice] = 'Post created successfully'
    redirect_to user_posts_path
  end
end
