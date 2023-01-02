class TestPost < ApplicationRecord
    belongs_to :user
    has_many :likes_you
end
