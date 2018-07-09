class MoviesController < ApplicationController

  def welcome
    #mediaocean.com/recent_reviews
  end

  def index
    @movies = Movie.all
  end

  def show
    set_movie
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

end
