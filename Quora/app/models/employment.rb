class Employment < ApplicationRecord
	belongs_to :user
	validates :position, presence: true
	validates :company, presence: true
	validates :user_id, uniqueness: true
end
