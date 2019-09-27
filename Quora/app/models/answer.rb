class Answer < ApplicationRecord
  belongs_to :question
  has_many :upvotes
  has_many :downvotes
  has_and_belongs_to_many :users
  has_many :bookmarkAnswers
  validates :data, presence: true, uniqueness: true
end
