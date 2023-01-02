class ChangeToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :sex, :string, default: ""
    add_column :users, :sex, :integer, default: 0
  end
end
