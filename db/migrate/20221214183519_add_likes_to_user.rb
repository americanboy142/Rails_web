class AddLikesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :likes, :integer, array: true, default: []
    add_column :users, :likes_you, :integer, array: true, default: []
  end
end
