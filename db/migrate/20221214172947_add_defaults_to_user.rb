class AddDefaultsToUser < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :pref_dist_min, :default => 0
    change_column_default :users, :pref_dist_max, :default => 50
    change_column_default :users, :pref_age_min, :default => 0
    remove_column :users, :height
    remove_column :users, :pref_height
    add_column :test_posts, :distance, :float
    add_column :test_posts, :sex, :integer
  end
end
