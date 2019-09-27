class AnswersUser < ApplicationRecord
  belongs_to :answer
  belongs_to :user
end
