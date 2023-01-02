class CreateTestPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :test_posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
