require 'rails_helper'
# frozen_string_literal: true

RSpec.describe User, type: :model do
  subject(:user) { User.new(name: 'marry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Software Developer from Spain.') }
  before { subject.save }
  it 'is valid subject' do
    expect(user).to be_valid
  end

  it 'is not valid without name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'should return post_count as zero' do
    expect(user.posts.size).to be(0)
  end
  it 'should return post_count as one' do
    post = Post.create(title: 'hello', text: 'hello world test', author_id: user.id)
    expect(post.user.posts_count).to be(1)
    expect(post.user.posts.size).to be(1)
  end
  it 'should be invalid on non integer post counter' do
    user.posts_count = 'dd'
    expect(user).to_not be_valid
  end
  it 'should be invalid for  negetive integer post counter' do
    user.posts_count = -1
    expect(user).to_not be_valid
  end
end
