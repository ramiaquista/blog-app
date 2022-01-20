require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { described_class.new }
  describe 'Methods' do
    it 'should update like counter' do
      like = Like.new
      expect(like.update_likes_counter).to eq([])
    end
  end
end
