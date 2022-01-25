class LikesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    like = Like.new(user_id: user.id, author_id: user.id, post_id: post.id)
    like.save
    redirect_to user_post
  end
end
