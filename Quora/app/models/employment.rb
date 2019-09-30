class Employment < ApplicationRecord
	belongs_to :user
	validates :position, presence: true,format: { with: /\A[a-zA-Z ]+\z/, message:"only letter allow for position value"}
	validates :company, presence: true ,format: { with: /\A[a-zA-Z ]+\z/, message:"only letter allow for company value"}
	validates :user_id, uniqueness: true 
end
