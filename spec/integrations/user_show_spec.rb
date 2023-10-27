require 'rails_helper'

RSpec.describe 'users#show', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'John',
      photo: 'john.jpg',
      bio: 'Web Developer',
      posts_count: 0
    )

    @user2 = User.create(
      name: 'James',
      photo: 'james.jpg',
      bio: 'Web Developer',
      posts_count: 0
    )

    @posts = [
      Post.create(author_id: @user1, title: 'User 1 Post 1', text: 'This is User 1 Post 1', comments_count: 0,
                  likes_count: 0),
      Post.create(author_id: @user1, title: 'User 1 Post 2', text: 'This is User 1 Post 2', comments_count: 0,
                  likes_count: 0),
      Post.create(author_id: @user1, title: 'User 1 Post 3', text: 'This is User 1 Post 3', comments_count: 0,
                  likes_count: 0),
      Post.create(author_id: @user2, title: 'User 2 Post 1', text: 'This is User 2 Post 1', comments_count: 0,
                  likes_count: 0),
      Post.create(author_id: @user2, title: 'User 2 Post 2', text: 'This is User 2 Post 2', comments_count: 0,
                  likes_count: 0),
      Post.create(author_id: @user2, title: 'User 2 Post 3', text: 'This is User 2 Post 3', comments_count: 0,
                  likes_count: 0)
    ]

    visit users_url
  end

  describe '#show page' do
    before(:each) do
      visit user_path(@user1)
    end

    it 'can see the user profile picture' do
      expect(page).to have_css("img[src='#{@user1.photo}']")
    end

    it 'can see the user username' do
      expect(page).to have_content(@user1.name.to_s)
    end

    it 'can see the number of posts the user has written' do
      expect(page).to have_content(@user1.posts_count.to_s)
    end

    it 'can see the user bio' do
      expect(page).to have_content(@user1.bio.to_s)
    end

    it 'can see the user first 3 posts' do
      @user1.recent_posts.each do |post|
        expect(page).to have_content(post.text)
      end
    end

    it 'can see a button to view all user posts' do
      page.all('div.col-lg-12.border.border-dark').each_with_index do |_el, _i|
        expect(page).to have_selector('button', text: 'See all posts')
      end
    end

    it 'redirects to the user posts index page when "See all posts" button is clicked' do
      page.all('div.col-lg-12.border.border-dark').each_with_index do |_el, _i|
        expect(page).to have_link('See all posts', href: user_posts_path(@user1))
      end
    end
  end

  describe 'GET/posts/show' do
    it 'redirects me to post show page when I click a user post' do
      page.all('div.col-lg-12.border.border-dark').each_with_index do |el, i|
        within(el) do
          post = @user1.posts[i]
          expect(page).to have_link(post.title, href: user_post_path(post.author_id, post))
        end
      end
    end
  end
end
