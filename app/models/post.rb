class Post < ApplicationRecord
  belongs_to :user

  def update_post_counter(_user)
    :user.update(posts_counter: Post.all)
  end
end
