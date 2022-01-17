class Like < ApplicationRecord
  belongs_to :user, :post

  def update_likes_counter
    :post.update(likes_counter: Like.all)
  end
end
