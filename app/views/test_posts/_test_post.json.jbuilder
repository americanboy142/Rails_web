json.extract! test_post, :id, :title, :body, :user_id, :created_at, :updated_at
json.url test_post_url(test_post, format: :json)
