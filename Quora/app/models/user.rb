class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :questions, dependent: :destroy
	has_many :userFollowers
	has_many :userFollowings
	has_and_belongs_to_many :topics, dependent: :destroy
	has_one :employment, dependent: :destroy
	has_and_belongs_to_many :answers
	has_many :followedQuestions
	has_many :bookmarkAnswers
	has_one :education,dependent: :destroy
	has_many :follows, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :bookmark_questions, dependent: :destroy
  def current_admin
    current_user && current_user.is_admin
  end
end
