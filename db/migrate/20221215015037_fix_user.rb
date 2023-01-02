class FixUser < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :pref_dist_min, 0
    change_column_default :users, :pref_dist_max,  50
    change_column_default :users, :pref_age_min,  18
    change_column_default :users, :likes,  []
    change_column_default :users, :likes_you, []
  end
end
