class AddCounterToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :likes_counter, :integer
    add_column :posts, :comments_counter, :integer
  end
end
