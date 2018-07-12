class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  has_many :reviews, dependent: :destroy
  has_many :user_movies
  has_many :movies, through: :user_movies
  has_many :active_relationships, class_name:  "Relationship",
                                foreign_key: "follower_id",
                                dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships

  def has_reviewed?(movie)
    rm = self.reviewed_movies.select do |m|
      m.movie_id == movie.id
    end
    !rm.empty?
  end

  def has_seen?(movie)
    seen_movies = self.seen_user_movies.select do |m|
      m.movie_id == movie.id
  end
    !seen_movies.empty?
  end

  def on_watchlist?(movie)
    watchlist = self.watchlisted_movies.select do |m|
      m.movie_id == movie.id
    end
      !watchlist.empty?
  end

  def reviewed_movies
    self.reviews.select do |r|
      r.user_id = self.id
    end
  end

  def seen_user_movies
    self.user_movies.select do |m|
      m.seen == true
    end
  end

  def self.search(search)
    if search
      where('username LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def watchlisted_movies
    self.user_movies.select do |m|
      m.seen == false
    end
  end

end
