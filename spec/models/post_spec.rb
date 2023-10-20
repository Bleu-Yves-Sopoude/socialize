require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:user) { User.new(name: 'marry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Software Developer from Spain.') }
  subject(:post) { Post.new(title: 'hello world', text: 'Hello world paragraph', author_id: user.id) }
  before { user.save }
  before { post.save }
  it 'should be valid post' do
    expect(post).to be_valid
  end
  it 'should be invalid post' do
    post.title = nil
    expect(post).to_not be_valid
  end
  it 'should be invalid post [maximum length for title is 250]' do
    post.title = '
    Contrary to popular belief,
    Lorem Ipsum is not simply random text.
    It has roots in a piece of classical Latin literature from 45 BC,
    making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia,
    looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through
    the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from
    sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero,
    written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.
    The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.'
    expect(post).to_not be_valid
  end
  it 'should have post counter to 1' do
    expect(post.user.posts_count).to be(1)
  end
end
