require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'John',
      photo: 'john.jpg',
      bio: 'Web Developer',
      posts_count: 0
    )

    @posts = [
      @post1 = Post.create(author_id: @user, title: 'User Post 1', text: 'This is User Post 1'),
      @post2 = Post.create(author_id: @user, title: 'User Post 2', text: 'This is User Post 2'),
      @post3 = Post.create(author_id: @user, title: 'User Post 3', text: 'This is User Post 3')

    ]
    visit user_posts_url(user_id: @user.id)
  end
  describe '#index page' do
    it 'can see the user profile picture.' do
      expect(page).to have_css("img[src='#{@user.photo}']")
    end
    it 'can see the user username.' do
      expect(page).to have_content(@user.name.to_s)
    end
    it 'can see the number of posts the user has written.' do
      expect(page).to have_content(@user.posts_count.to_s)
    end
    it 'can see posts title' do
      page.all('div.col-lg-12.border.border-dark').each_with_index do |el, i|
        within(el) { expect(page).to have_content(@posts[i].title) }
      end
    end
    it 'can see some of the bodys post' do
      page.all('div.col-lg-12.border.border-dark').each_with_index do |_el, i|
        expect(page).to have_content(post[i].text)
      end
    end
    it 'can see the first comments on a post.' do
      @posts.each do |post|
        post.recent_comment.each do |comment|
          expect(page).to have_content(comment.user.text)
        end
      end
    end
    it 'can see how many comments a post has' do
      @posts.each do |post|
        expect(page).to have_content(post.comments_count.to_s)
      end
    end
    it 'can see how many likes a post has' do
      @posts.each do |post|
        expect(page).to have_content(post.likes_count.to_s)
      end
    end
  end
  describe 'GET show/page' do
    it 'redirects me to that posts show page, when I clicked on a post.' do
      page.all('div.col-lg-12.border.border-dark').each_with_index do |el, _i|
        within(el) { expect(page).to have_current_path(user_post_path(post.author, post)) }
      end
    end
  end
end
