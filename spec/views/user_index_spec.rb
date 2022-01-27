require 'rails_helper'

RSpec.describe 'User Index validation', type: :system do
    describe 'User index' do
    before {
        visit new_user_session_path
        User.create(name: 'mat',
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
    }
    it 'shows the number of posts of the users' do
    sleep(5)
        expect(page).to have_content("Number Of Post:")
    end
    it 'shows the username of the users' do
        sleep(5)
        expect(page).to have_selector("name")
    end
  end
end