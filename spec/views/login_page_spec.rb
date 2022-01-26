require 'rails_helper'

RSpec.describe 'User Validation', type: :system do
  describe 'LogIn page' do
    it 'shows the right content' do
      visit new_user_session_path
      sleep(3)
      expect(page).to have_field('Username')
      expect(page).to have_field('Password')
      expect(page).to have_selector(:link_or_button, 'Log in')
    end
    it 'should raise an error if the inputs are empty' do
      visit new_user_session_path
      sleep(1)
      click_button('Log in')
      sleep(3)
      expect(page).to have_field('Username', with: '')
      expect(page).to have_field('Password', with: '')
      expect(page).to have_content('Invalid Email or password.')
    end
    it 'should raise an error if the data is invalid' do
      visit new_user_session_path
      sleep(1)
      page.fill_in 'Username', with: 'josh@gmail.com'
      sleep(1)
      page.fill_in 'Password', with: '12'
      sleep(1)
      expect(page).to have_field('Username', with: 'josh@gmail.com')
      expect(page).to have_field('Password', with: '12')
      click_button('Log in')
      sleep(3)
      expect(page).to have_content('Invalid Email or password.')
    end
    it 'should redirect to the root page if the data is correct' do
      visit new_user_session_path
      User.create(name: 'po',
                  photo: 'https://cdnwp-s3.benzinga.com/wp-content/uploads/2021/11/18141437/CurryApe.png',
                  bio: 'po bio', posts_counter: 0, email: 'po@gmail.com', password: '123456')
      sleep(1)
      page.fill_in 'Username', with: 'po@gmail.com'
      sleep(1)
      page.fill_in 'Password', with: '123456'
      sleep(1)
      expect(page).to have_field('Username', with: 'po@gmail.com')
      expect(page).to have_field('Password', with: '123456')
      click_button('Log in')
      sleep(2)
      expect(page).to have_current_path(root_path)
      sleep(2)
    end
  end
end
