class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_create :update_likes_counter

  def update_likes_counter
    post = Post.find(post_id)
    post.increment!(:likes_counter)
    post.save
  end
end
