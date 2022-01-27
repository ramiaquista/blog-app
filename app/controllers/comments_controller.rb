class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
# POST post/comments
  def create
    @current_user = current_user
    @post = Post.find(params[:post_id])
    returned_values = comment_params
    returned_values.merge!(user_id: @current_user.id, author_id: @current_user.id, post_id: @post.id)
    @comment = @current_user.comment.new(returned_values)
    if @comment.save
      @comment.update_comment_counter(@post.id)
      redirect_to user_post_path(id: @post.id), flash: { comment_added: 'Comment added Successfully!' }
      render json: @comment
    else
      redirect_to new_user_post_comment_path, flash: { unable_to_add: 'Comment not added, try again!' }
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(id: @post.id), flash: { comment_deleted: 'Comment deleted Successfully!' }
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
