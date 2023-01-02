class ChangeLikesToStringAddDislike < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :likes, -1
    change_column_default :users, :likes_you, -1 
    add_column :users, :dislikes, :integer , array: true, default: -1
    add_column :users, :dislikes_you, :integer , array: true, default: -1
  end
end
