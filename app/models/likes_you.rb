class LikesYou < ApplicationRecord
  belongs_to :test_post
  belongs_to :user

end
