class ForeignKeyPost < ActiveRecord::Migration[7.0]
  def change
    change_column :test_posts, :user_id, :integer, null: false, references: :user, foreign_key: true
  end
end
