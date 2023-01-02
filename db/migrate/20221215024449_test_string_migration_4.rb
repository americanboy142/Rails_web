class TestStringMigration4 < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :likes, :integer, array: true
    change_column :users, :likes_you, :integer, array: true
  end
end
