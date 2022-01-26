require 'rails_helper'

RSpec.describe 'User post index page', type: :system do
  before(:all) do
    @user = User.create(name: 'John Smith',
      photo: 'https://cdnwp-s3.benzinga.com/wp-content/uploads/2021/11/18141437/CurryApe.png',
      bio: 'Software developer', posts_counter: 0, email: 'po@gmail.com', password: '123456')

    @post = Post.create(title: 'This is the post title', text: 'Content post 1', author_id: @user.id, user_id: @user.id, 
      comments_counter: 0, likes_counter: 0)

    @comment = Comment.create(text: 'This is the first comment', author_id: @user.id, user_id: @user.id, 
      post_id: @post.id)

    @like = Like.create(author_id: @user.id, user_id: @user.id, post_id: @post.id)
  end

  after(:all) do
    @like.destroy
    @comment.destroy
    @post.destroy
    @user.destroy
  end

  it "should show the user's profile picture" do
    visit user_posts_path(@user.id)
    expect(page.find('.user-img img')['src']).to have_content 'CurryApe.png'
  end

  it "should show the user's username" do
    visit user_posts_path(@user.id)
    expect(page).to have_content('John Smith')
  end

  it "should show the number of posts the user has written" do
    visit user_posts_path(@user.id)
    expect(page).to have_content('Number Of Posts: 1')
  end

  it "should show a post's title" do
    visit user_posts_path(@user.id)
    expect(page).to have_content('This Is The Post Title')
  end

  it "should show some of the post's body" do
    visit user_posts_path(@user.id)
    expect(page).to have_content('Content post 1')
  end

  it "should show the first comments on a post" do
    visit user_posts_path(@user.id)
    expect(page).to have_content('This Is The First Comment')
  end

  it "should show how many comments a post has" do
    visit user_posts_path(@user.id)
    expect(page).to have_content('Comments: 1')
  end
  
  it "should show how many likes a post has" do
    visit user_posts_path(@user.id)
    expect(page).to have_content('Likes: 1')
  end
  
  it "should show a section for pagination if there are more posts than fit on the view" do
    visit user_posts_path(@user.id)
    expect(page).to have_content('Likes: 1')
  end
end