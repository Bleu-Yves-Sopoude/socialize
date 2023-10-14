class AddDefaultToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :post_count, from: nil, to: 0
  end
end
