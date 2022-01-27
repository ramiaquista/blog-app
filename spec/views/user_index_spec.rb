require 'rails_helper'

RSpec.describe 'User Index validation', type: :system do
  describe 'User index' do
    before do
      visit new_user_session_path
      User.create(name: 'mat',
                  photo: 'https://cdnwp-s3.benzinga.com/wp-content/uploads/2021/11/18141437/CurryApe.png',
                  bio: 'po bio', posts_counter: 0, email: 'po@gmail.com', password: '123456')

      page.fill_in 'Username', with: 'po@gmail.com'
      page.fill_in 'Password', with: '123456'
      click_button('Log in')
    end
    it 'shows the number of posts of the users' do
      expect(page).to have_content('Number Of Post:')
    end
    it 'shows the username of the users' do
      expect(page).to have_css('.name')
    end
    it 'shows the profile picture of user' do
      expect(page).to have_css('.user-img')
    end
    it 'redirects to the user profile' do
      user_container = find('.user-container')
      sleep(2)
      user_container.click
      sleep(2)
      expect(page).to have_content('bio')
    end
  end
end
