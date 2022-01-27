require 'rails_helper'

RSpec.describe 'User Profile validation', type: :system do
    describe 'User profile' do
        before{ 
            user = User.find_by(name:'mat')
            Post.create(title: 'Travel', text: 'Travel bio', user_id: user.id, author_id: user.id,
                         comments_counter: 1, likes_counter: 1)
            Post.create(title: 'Travel-2', text: 'Travel-2 bio', user_id: user.id, author_id: user.id,
                         comments_counter: 2, likes_counter: 2)
            Post.create(title: 'Travel-3', text: 'Travel-3 bio', user_id: user.id, author_id: user.id,
            comments_counter: 3, likes_counter: 3)       
            visit new_user_session_path        
            page.fill_in 'Username', with: 'po@gmail.com'
            page.fill_in 'Password', with: '123456'
            click_button('Log in')
            user_container = find(".user-container")
            user_container.click
        }
        it 'shows the profile picture of user' do 
            user = User.find_by(name:'mat')
            sleep(1) 
            expect(page.find('#img')['src']).to have_content("#{user.photo}")
        end
        it 'shows the username of user' do 
            user = User.find(25)
            sleep(1)   
            expect(page.find('.name')).to have_content(%r{#{user.name}}i)
        end
        it 'shows the number of post of user' do 
            user = User.find(25)
            sleep(1)   
            expect(page.find('.number-posts')).to have_content("#{user.posts_counter}")
        end
        it 'shows the Bio of user' do 
            user = User.find(25)
            sleep(1)   
            expect(page.find('.bio-text')).to have_content("#{user.bio}")
        end
         it 'shows the 3 latest posts of user' do 
            expect(page).to have_selector("li", count:4)
        end
        it 'shows the see all posts button' do     
            expect(page).to have_selector("button")
        end
        it 'redirects to post page' do            
            first('.post-user-section').click
            sleep(3)
            expect(page).to have_content('Create Comment')
        end
        it 'redirects to user posts page' do            
            find('.btn-user-details').click
            sleep(3)
            expect(page).to have_content('Pagination')
        end
    end
end