require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET index' do
    before(:example) { get users_path }
    it 'is a succes' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render users#index template' do
      expect(response).to render_template('index')
    end
  end
  describe 'GET show' do
    before(:example) { get '/users/show' }
    it 'is a succes' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render users#show template' do
      expect(response).to render_template('show')
    end
  end
end

RSpec.describe 'Users', type: :feature do
  it 'renders the correct text in the index template' do
    visit '/users'
    expect(current_path).to eq('/users')
    expect(page).to have_text('This is a list of all the users')
  end
  it 'renders the correct text in the show template' do
    visit '/users/show'
    expect(current_path).to eq('/users/show')
    expect(page).to have_text('This shows the user data')
  end
end
