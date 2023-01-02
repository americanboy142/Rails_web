class AddIdToTestPost < ActiveRecord::Migration[7.0]
  def change
    add_column :test_posts, :user_id, :integer, unique: true
  end
end
