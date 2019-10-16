class Question < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :answers, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :bookmark_questions, dependent: :destroy
  validates :data, presence: true, uniqueness: true
end
