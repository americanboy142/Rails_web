class AddMatchesFixNamesUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :pre_sex, :pref_sex
    remove_column :users, :dislikes_you
    remove_column :users, :likes_you
  end
end
