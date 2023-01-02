class AddAgeToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :test_posts, :age, :int
  end
end
