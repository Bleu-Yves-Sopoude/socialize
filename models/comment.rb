class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id', counter_cache: true

  after_save :update_counter

  def update_counter
    post.update(comments_count: post.comments.size)
  end
end
