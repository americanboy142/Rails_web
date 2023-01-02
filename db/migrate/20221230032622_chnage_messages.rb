class ChnageMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :user2
    add_reference :messages, :match, foreign_key: true, index: true
    remove_column :messages, :user_id
    add_reference :messages, :user
    
  end
end
