class CommentsController < ApplicationController
  def new
    respond_to do |_format|
      comment = Comment.new
      @current_user = current_user
      respond_to do |format|
        format.html { render :new, locals: { comment: comment } }
      end
    end
  end
end
