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

  def self.search(search)
    if search
      where('username LIKE ?', "%#{search}%")
    else
      all
    end
  end



end
