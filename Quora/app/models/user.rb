class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :questions, dependent: :destroy
	has_many :userFollowers
	has_many :userFollowings
	has_and_belongs_to_many :topics
	has_one :employment
	has_and_belongs_to_many :answers
	has_many :followedQuestions
	has_many :bookmarkAnswers
	has_one :userLocation, dependent: :destroy
	has_one :education
	has_many :upvotes
	has_many :downvotes
	has_many :follows
	validates :email,format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness: true
	validates :name, presence:true,format:{ with: /\A[a-zA-Z]+\z/,message:"only allows letter"}
	validates :password, :presence => true,
                   :confirmation => true,
                   :length => {:within => 6..40},
                   :unless => :force_submit
end
