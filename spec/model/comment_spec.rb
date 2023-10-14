require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:user) { User.new(name: 'marry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Software Developer from Spain.') }
  before { user.save }
  subject(:post) { Post.new(title: 'hello world', text: 'Hello world paragraph', author_id: user.id) }
  before { post.save }
  subject(:comment) { Comment.new(user_id: user.id, post_id: post.id, text: 'this  is my comment') }
  before { comment.save }

  it 'should be valid comment' do
    expect(comment).to be_valid
  end
  it 'comment should match' do
    expect(comment.text).to eq 'this  is my comment'
  end
  it 'post comment should be update on comment save' do
    expect(comment.post.comments.size).to be(1)
  end
  it 'comment user id should be same' do
    expect(comment.user.id).to be(user.id)
  end
  it 'comment post id should be same' do
    expect(comment.post.id).to be(post.id)
  end
  it 'should be invalid on negetive comment counter' do
    comment.post.comments_count = -1
    expect(comment.post).to_not be_valid
  end
  it 'should be invalid on non negetive comment counter' do
    comment.post.comments_count = 'test'
    expect(comment.post).to_not be_valid
  end
end
