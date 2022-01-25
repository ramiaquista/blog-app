class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  belongs_to :author, class_name: 'User'

  def update_post_counter
    :author.update(posts_counter: Post.all)
  end

  def most_recent_comments
    Post.includes(:comments).limit(5).order(created_at: :desc)
  end
end
