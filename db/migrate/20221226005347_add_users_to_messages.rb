class AddUsersToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :user_id,  :integer, index: true
    add_column :messages, :user2, :integer
  end
end
