require 'rails_helper'
RSpec.describe 'users#index', type: :feature do
  before do
    @users = [
      User.create(name: 'Mary', photo: 'mary.jpg', bio: 'Software Developer', posts_count: 0),
      User.create(name: 'David', photo: 'david.jpg', bio: 'Software Developer', posts_count: 0),
      User.create(name: 'Justin', photo: 'justin.jpg', bio: 'Software Developer', posts_count: 0)
    ]

    @posts = [
      @post1 = Post.create(author_id: @user, title: 'User Post 1', text: 'This is User Post 1'),
      @post2 = Post.create(author_id: @user, title: 'User Post 2', text: 'This is User Post 2'),
      @post3 = Post.create(author_id: @user, title: 'User Post 3', text: 'This is User Post 3')

    ]
    visit users_path
  end
  describe '#index page' do
    it 'can see the username of all other users.' do
      expect(page).to have_content(@users[0].name)
    end
    it 'can see the profile picture for each user.' do
      @users.each do |user|
        expect(page).to have_css("img[src='#{user.photo}']")
      end
    end
    it 'can see the number of posts each user has written.' do
      @users.each do |user|
        expect(page).to have_content(user.posts_count.to_s)
      end
    end
    it 'redirects me to that posts show page when I click on a post' do
      page.all('div.col-lg-12.border.border-dark').each_with_index do |el, _i|
        within(el) { expect(page).to have_current_path(user_post_path(post.author, post)) }
      end
    end
  end
end
