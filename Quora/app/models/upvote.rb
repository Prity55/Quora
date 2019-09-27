class Upvote < ApplicationRecord
  belongs_to :answer
  belongs_to :user
  validates :user_id, presence: true
end
