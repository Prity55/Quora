class Education < ApplicationRecord
  belongs_to :user
  validates :school, presence:true
 
end
