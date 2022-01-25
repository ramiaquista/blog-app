class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def update_comment_counter(post_id)
    total_comment = Comment.includes(:post).where("post_id = #{post_id}").references(:post).count
    Post.find(post_id).update(comments_counter: total_comment)
  end

  def user_name(user_id)
    user = User.find(user_id)
    user.name
  end
end
