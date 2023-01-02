class LikesBackToString < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :likes, :string 
    change_column :users, :likes_you, :string 
    change_column :users, :dislikes, :string 
    change_column :users, :dislikes_you, :string 
  end
end
