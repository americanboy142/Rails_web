class UserIdIndesPost < ActiveRecord::Migration[7.0]
  def change
    add_index :test_posts, :user_id
  end
end
