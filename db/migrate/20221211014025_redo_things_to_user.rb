class RedoThingsToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role, :integer 
    remove_column :users, :DOB, :date
    remove_column :users, :sex, :string
    remove_column :users, :name, :string

    add_column :users, :name, :string, default: ""
    add_column :users, :DOB, :date
    add_column :users, :sex, :string, default: ""
    add_column :users, :role, :integer, default: 0
  end
end
