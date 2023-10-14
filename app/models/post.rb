class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', counter_cache: true
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :likes_count, presence: false, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_count, presence: false, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_counter

  def update_counter
    user.update(posts_count: user.posts.size)
  end

  def recent_comment
    comments.where(post_id: self[:id]).order(created_at: :desc).limit(5)
  end
end
