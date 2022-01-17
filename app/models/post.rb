class Post < ApplicationRecord
  has_many :comments, :likes
  belongs_to :user

  def update_post_counter
    :user.update(posts_counter: Post.all)
  end

  def most_recent_comments(post)
    post.includes(:comments).limit(5).order(created_at: :desc)
  end
end
