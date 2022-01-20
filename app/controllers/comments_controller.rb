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
    if @comment.save
      flash[:notice] = 'Comment created successfully'
    else
      flash[:error] = "Couldn\'t create the comment"
    end
    redirect_to user_posts_path
  end
end
