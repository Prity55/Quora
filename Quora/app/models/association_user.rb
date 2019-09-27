has_many :questions, dependent: :destroy
	has_many :userFollowers
	has_many :userFollowings
	has_and_belongs_to_many :topics
	has_one :employment
	has_and_belongs_to_many :answers
	has_many :followedQuestions
	has_many :bookmarkAnswers
	has_one :userLocation, dependent: :destroy
	has_one :education, dependent: :destroy
	has_many :upvotes
	t.string :profile_credential
      t.string :description