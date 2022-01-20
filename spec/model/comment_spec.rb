require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { described_class.new }
  describe 'Methods' do
    it 'should update ldike counter' do
      comment = Comment.new
      expect(comment.update_comments_counter).to eq([])
    end
  end
end
