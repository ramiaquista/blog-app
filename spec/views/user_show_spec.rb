require 'rails_helper'

RSpec.describe 'User Profile validation', type: :system do
  describe 'User profile' do
    before(:each) do
      @user = User.create(name: 'mat',
                          photo: 'https://cdnwp-s3.benzinga.com/wp-content/uploads/2021/11/18141437/CurryApe.png',
                          bio: 'mat bio', posts_counter: 0, email: 'mat@gmail.com', password: '123456')
      Post.create(title: 'Travel', text: 'Travel bio', user_id: @user.id, author_id: @user.id,
                  comments_counter: 1, likes_counter: 1)
      Post.create(title: 'Travel-2', text: 'Travel-2 bio', user_id: @user.id, author_id: @user.id,
                  comments_counter: 2, likes_counter: 2)
      Post.create(title: 'Travel-3', text: 'Travel-3 bio', user_id: @user.id, author_id: @user.id,
                  comments_counter: 3, likes_counter: 3)
      visit new_user_session_path
      page.fill_in 'Username', with: 'mat@gmail.com'
      page.fill_in 'Password', with: '123456'
      click_button('Log in')
      user_container = find('.user-container')
      user_container.click
    end
    it 'shows the profile picture of user' do
      sleep(1)
      expect(page.find('#img')['src']).to have_content(@user.photo.to_s)
    end
    it 'shows the username of user' do
      sleep(1)
      expect(page.find('.name')).to have_content(/#{@user.name}/i)
    end
    it 'shows the number of post of user' do
      sleep(1)
      expect(page.find('.number-posts')).to have_content('Number Of Post: 3')
    end
    it 'shows the Bio of user' do
      sleep(1)
      expect(page.find('.bio-text')).to have_content(@user.bio.to_s)
    end
    it 'shows the 3 latest posts of user' do
      expect(page).to have_selector('li', count: 4)
    end
    it 'shows the see all posts button' do
      expect(page).to have_selector('button')
    end
    it 'redirects to post page' do
      first('.post-user-section').click
      sleep(3)
      expect(page).to have_content('Create Comment')
    end
    it 'redirects to user posts page' do
      find('.btn-user-details').click
      sleep(3)
      expect(page).to have_current_path(user_posts_path(user_id: @user.id))
    end
  end
end
