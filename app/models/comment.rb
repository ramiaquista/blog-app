class Comment < ApplicationRecord
  belongs_to :user, :post

  def update_comments_counter
    :post.update(comments_counter: Comment.all)
  end
end
