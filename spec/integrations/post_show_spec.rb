require 'rails_helper'
RSpec.describe 'posts#show', type: :feature do
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
  describe '#show page' do
    before(:each) do
      visit user_posts_path(@user, @post3)
    end
    it 'can see posts title' do
      page.all('div.col-lg-12.border.border-dark').each_with_index do |el, i|
        within(el) { expect(page).to have_content(@posts[i].title) }
      end
    end
    it 'can see who wrote the post.' do
      expect(page).to have_content(@user.name.to_s)
    end
    it 'can see how many comments it has' do
      expect(page).to have_content(@post3.comments_count.to_s)
    end
    it 'can see how many likes a post has' do
      expect(page).to have_content(@post3.likes_count.to_s)
    end
    it 'can see the post body' do
      page.all('div.col-lg-12.border.border-dark').each_with_index do |el, i|
        within(el) { expect(page).to have_content(@posts[i].text) }
      end
    end
    it 'can see the username of each commentor' do
      @post1.recent_comment.each do |comment|
        expect(page).to have_content(comment.user.name)
      end
    end
    it 'can see the comment each commentor left.' do
      @post1.recent_comment.each do |comment|
        expect(page).to have_content(comment.user.text)
      end
    end
  end
end
