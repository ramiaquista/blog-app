require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }
  describe 'Validations' do
    it 'is valid with valid attributes' do
      subject.name = 'Rami'
      subject.posts_counter = 2
      expect(subject).to be_valid
    end
    it 'is not valid without attributes' do
      expect(User.new).to_not be_valid
    end
    it 'is not valid without a name' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end
    it 'is not valid if posts counter is less than 0' do
      user = User.new(name: 'Rami', posts_counter: -1)
      expect(user).to_not be_valid
    end
  end
  describe 'Associations' do
    it { should respond_to(:posts) }
    it { should respond_to(:comments) }
    it { should respond_to(:likes) }
  end
  describe 'Methods' do
    it 'should return an empty array' do
      user = User.new(name: 'Rami', posts_counter: 0)
      expect(user.most_recent_posts).to eq([])
    end
  end
end
