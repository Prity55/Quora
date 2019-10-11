class Answer < ApplicationRecord
  belongs_to :question
  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
  has_and_belongs_to_many :users
  has_many :bookmarkAnswers
  has_many :votes, dependent: :destroy
  validates :data, presence: true, uniqueness: true
end
