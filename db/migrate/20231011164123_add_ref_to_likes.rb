class AddRefToLikes < ActiveRecord::Migration[7.1]
  def change
    add_reference :likes, :user, index: true, foreign_key: true
    add_reference :likes, :post, index: true, foreign_key: true
  end
end
