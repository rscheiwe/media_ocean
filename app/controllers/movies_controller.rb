class MoviesController < ApplicationController

  def welcome
    #mediaocean.com/recent_reviews
  end

  def index
    @movies = Movie.all
    if params[:search]
      @movies = Movie.movie_search(params[:search]).order("created_at DESC")
      @movies_search = @movies.map {|movie| movie_path(movie)}

    else
      @movies = Movie.all.order("created_at DESC")
    end
  end

  def show
    set_movie
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

end
