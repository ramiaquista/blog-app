require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET index' do
    before(:example) { get '/users/:user_id/posts' }
    it 'is a succes' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render posts#index template' do
      expect(response).to render_template('index')
    end
  end
  describe 'GET show' do
    before(:example) { get '/users/:user_id/posts/:id' }
    it 'is a succes' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render posts#show template' do
      expect(response).to render_template('show')
    end
  end
end

RSpec.describe 'Posts', type: :feature do
  it 'renders the correct text in the index template' do
    visit '/users/1/posts'
    expect(current_path).to eq('/users/1/posts')
    expect(page).to have_text('This shows all the posts from the user')
  end
  it 'renders the correct text in the show template' do
    visit '/users/1/posts/show'
    expect(current_path).to eq('/users/1/posts/show')
    expect(page).to have_text('This shows full description of the selected post')
  end
end
