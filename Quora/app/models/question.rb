class Question < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :suggested_edits, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :followedQuestions 
  has_many :follows, dependent: :destroy
  validates :data, presence: true, uniqueness: true
end
