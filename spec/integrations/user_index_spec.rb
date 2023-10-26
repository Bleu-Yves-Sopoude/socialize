require 'rails_helper'
RSpec.describe 'users#index', type: :feature do
  before do
    @users = [
      User.create(name: 'Mary', photo: 'mary.jpg', bio: 'Software Developer', posts_count: 0),
      User.create(name: 'David', photo: 'david.jpg', bio: 'Software Developer', posts_count: 0),
      User.create(name: 'Justin', photo: 'justin.jpg', bio: 'Software Developer', posts_count: 0)
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
        post = @posts.first
        click_link(post.title, match: :first) # Add match: :first to ensure the first matching link is clicked
        expect(page).to have_current_path(user_post_path(user_id: @user, id: post))
      end
    end      
end