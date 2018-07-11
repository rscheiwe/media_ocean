class Review < ApplicationRecord

  belongs_to :movie
  belongs_to :user

	validates :content, presence: true
	validates :rating, :inclusion => { :in => 0..5 } 
	validates :user_id, uniqueness: { scope: :movie_id , message: "Each user can review a movie only once."} 
end
