class User < ApplicationRecord
  has_many :posts, :comments, :likes

  def most_recent_posts(user)
    user.includes(:posts).limit(3).order(created_at: :desc)
  end
end
