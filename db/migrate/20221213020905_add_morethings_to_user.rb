class AddMorethingsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :height, :float, default: nil
    add_column :users, :pre_sex, :integer, default: 1
    add_column :users, :pref_age_max, :integer
    add_column :users, :pref_age_min, :integer
    add_column :users, :pref_dist_min, :integer
    add_column :users, :pref_dist_max, :integer
    add_column :users, :pref_height, :float, default: nil
    add_column :test_posts, :bio, :text
  end
end
