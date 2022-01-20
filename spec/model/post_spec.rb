require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.new }
  describe 'Validations' do
    it 'is valid with valid attributes' do
      subject.title = 'Blue'
      subject.comments_counter = 4
      subject.likes_counter = 30
      subject.author = User.new(name: 'Rami', posts_counter: 1)
      expect(subject).to be_valid
    end
    it 'is not valid without attributes' do
      expect(Post.new).to_not be_valid
    end
    it 'is not valid without a title' do
      post = Post.new(title: nil)
      expect(post).to_not be_valid
    end
    it 'is not valid if comments counter is less than 0' do
      post = Post.new(title: 'Red', comments_counter: -1)
      expect(post).to_not be_valid
    end
    it 'is not valid if likes counter is less than 0' do
      post = Post.new(title: 'Red', likes_counter: -1)
      expect(post).to_not be_valid
    end
  end
  describe 'Associations' do
    it { should respond_to(:comments) }
    it { should respond_to(:likes) }
  end
  describe 'Methods' do
    it 'should return an empty array of comments' do
      post = Post.new(title: 'Yellow', comments_counter: 0)
      expect(post.most_recent_comments).to eq([])
    end
  end
end
