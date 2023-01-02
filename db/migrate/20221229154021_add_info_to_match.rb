class AddInfoToMatch < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :user_name, :string
    add_column :matches, :user2_name, :string
    
  end
end
