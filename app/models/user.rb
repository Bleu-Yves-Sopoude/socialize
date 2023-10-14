class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', primary_key: 'id'
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.where(author_id: self[:id]).order(created_at: :desc).limit(3)
  end
end
