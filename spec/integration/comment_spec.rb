require 'swagger_helper'

describe 'Comments API' do
  path '/users/1/posts/1/comments' do
    post 'Creates a comment' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string },
          user_id: { type: :integer },
          author_id: { type: :integer },
          post_id: { type: :integer }
        },
        required: %w[user_id post_id]
      }

      response '201', 'comment created' do
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['error']).to eq('Comment not added, try again')
        end
      end
    end
  end
end
