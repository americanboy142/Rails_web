class CreateLikesYous < ActiveRecord::Migration[7.0]
  def change
    create_table :likes_yous do |t|
      t.references :test_post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
