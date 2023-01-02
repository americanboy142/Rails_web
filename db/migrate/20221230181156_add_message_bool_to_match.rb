class AddMessageBoolToMatch < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :messaged, :boolean, default: false
  end
end
