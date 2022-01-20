class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def update_likes_counter
    Post.update(likes_counter: Like.all)
  end
end
