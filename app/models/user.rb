class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def most_recent_posts(user)
    user.includes(:posts).limit(3).order(created_at: :desc)
  end
end
