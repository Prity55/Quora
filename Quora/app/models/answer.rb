class Answer < ApplicationRecord
  belongs_to :question
  has_and_belongs_to_many :users
  has_many :votes, dependent: :destroy
  validates :data, presence: true, uniqueness: true
end
