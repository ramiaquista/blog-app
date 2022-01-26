require 'rails_helper'

RSpec.describe 'post show action', type: :system do
  describe 'Show Post Details Data' do
    it 'shows the right content' do
      user = User.create!(name: 'Po', photo: 'po photo', bio: 'po bio', posts_counter: 0, email: 'pollvcxz@gmail.com',
                          password: '123456')
      post = Post.create(title: 'Travel', text: 'Travel bio', user_id: user.id, author_id: user.id,
                         comments_counter: 3, likes_counter: 3)
      comment = Comment.create(text: 'First Comment', user_id: user.id, author_id: user.id, post_id: post.id)
      visit user_post_path(id: post.id, user_id: user.id)
      title_tag = find('.post-title-name')
      interactions_tag = find('.post-interactions')
      post_body = find('.post-text-extended')
      comment_body = find('.comment-body')
      expect(title_tag).to have_content("#{post.title} By #{user.name}")
      expect(interactions_tag).to have_content("Comments: #{post.comments_counter}, Likes: #{post.likes_counter}")
      expect(post_body).to have_content(post.text)
      expect(comment_body).to have_content("#{user.name}: #{comment.text}")
      sleep(5)
    end
  end
end
