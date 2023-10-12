class UpdateStringToText < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :bio, :text
    change_column :comments, :text, :text
  end
end
