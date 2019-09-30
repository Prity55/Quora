class Education < ApplicationRecord
  belongs_to :user
  validates :school, presence:true, format: { with: /\A[a-zA-Z ]+\z/, message:"only letter allow for concentration"}
  validates :concentration ,allow_blank: true,format: { with: /\A[a-zA-Z ]+\z/, message:"only letter allow for concentration"}
  validates :second_concentration, allow_blank: true ,format: { with: /\A[a-zA-Z ]+\z/, message:"only letter allow for second concentration"}
  validates :degree ,allow_blank: true,format: { with: /\A[a-zA-Z ]+\z/, message:"only letter allow for degree"}
end
