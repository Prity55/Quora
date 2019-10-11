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
	has_one :userLocation, dependent: :destroy
	has_one :education,dependent: :destroy
	has_many :upvotes,dependent: :destroy
	has_many :downvotes,dependent: :destroy
	has_many :follows, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  has_many :votes, dependent: :destroy
end
