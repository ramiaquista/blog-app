require 'swagger_helper'

describe 'Posts API' do
  path '/users/1/posts.json' do
    get 'Retrieves all posts' do
      tags 'Posts'
      produces 'application/json'
      response '200', 'posts retrieved' do
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['error']).to eq('You need to sign in or sign up before continuing.')
        end
      end
    end
  end
  path '/users/1/posts/24.json' do
    get 'Show comments for a post' do
      tags 'Show Comment'
      produces 'application/json', 'application/html'
      response '200', 'comment retrieved' do
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['error']).to eq('You need to sign in or sign up before continuing.')
        end
      end
    end
  end
end
