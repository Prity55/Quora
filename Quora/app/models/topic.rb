class Topic < ApplicationRecord
	has_many :questions, dependent: :destroy
	has_many :topics_users
	has_and_belongs_to_many :users
	validates :topic_name, presence: true, uniqueness: true
end
