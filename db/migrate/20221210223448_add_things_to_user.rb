class AddThingsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, default: ""
    add_column :users, :DOB, :date
    add_column :users, :sex, :string, default: ""
  end
end
