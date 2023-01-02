class AddReadRcptToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :read, :boolean, default: false
    add_column :messages, :delivered, :boolean, default: false
  end
end
