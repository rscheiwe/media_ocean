class UserMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :user_id, uniqueness: { scope: :movie_id , message: "This movie's already on your watchlist."} 

  # validates :movie_id, uniqueness: true
end
