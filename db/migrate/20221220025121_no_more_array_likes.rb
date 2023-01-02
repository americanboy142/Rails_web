class NoMoreArrayLikes < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :likes, :string, array: false, default: "-1"
    change_column :users, :dislikes, :string, array: false, default: "-1"
  end
end
