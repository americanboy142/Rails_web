# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_01_003618) do
  create_table "admin_tools", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes_yous", force: :cascade do |t|
    t.integer "test_post_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_post_id"], name: "index_likes_yous_on_test_post_id"
    t.index ["user_id"], name: "index_likes_yous_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "user2", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.string "user2_name"
    t.boolean "messaged", default: false
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "match_id"
    t.integer "user_id"
    t.boolean "read", default: false
    t.boolean "delivered", default: false
    t.index ["match_id"], name: "index_messages_on_match_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "test_posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.text "bio"
    t.float "distance"
    t.integer "sex"
    t.integer "age"
    t.index ["user_id"], name: "index_test_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: ""
    t.date "DOB"
    t.integer "role", default: 0
    t.integer "sex", default: 0
    t.text "bio"
    t.integer "pref_sex"
    t.integer "pref_age_max"
    t.integer "pref_age_min", default: 18
    t.integer "pref_dist_min", default: 0
    t.integer "pref_dist_max", default: 50
    t.string "likes", default: "-1"
    t.string "dislikes", default: "-1"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "likes_yous", "test_posts"
  add_foreign_key "likes_yous", "users"
  add_foreign_key "matches", "users"
  add_foreign_key "messages", "matches"
end
