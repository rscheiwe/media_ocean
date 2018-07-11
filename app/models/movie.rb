class Movie < ApplicationRecord

validates :apinum, uniqueness: true
validates :title, presence: true

has_many :reviews
has_many :user_movies

  def self.movie_search(search)
  	if search
  		where('title LIKE ?', "%#{search}%")
  	else
  		all
  	end
  end
end
