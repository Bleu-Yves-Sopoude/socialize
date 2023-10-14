require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:user) { User.new(name: 'marry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Software Developer from Spain.') }
  before { user.save }
  subject(:post) { Post.new(title: 'hello world', text: 'Hello world paragraph', author_id: user.id) }
  before { post.save }
  subject(:like) { Like.new(user_id: user.id, post_id: post.id) }
  before { like.save }
  it 'should be valid like' do
    expect(like).to be_valid
  end
  it 'post like count should be 1' do
    expect(like.post.likes.size).to be(1)
  end
  it 'user like count should be 1' do
    expect(like.user.likes.size).to be(1)
  end
  it 'should be invalid on negetive like counter' do
    like.post.likes_count = -1
    expect(like.post).to_not be_valid
  end
  it 'should not be valid for non integer like counter' do
    like.post.likes_count = 'dd'
    expect(like.post).to_not be_valid
  end
end
