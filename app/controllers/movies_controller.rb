class MoviesController < ApplicationController

  def welcome
    @movies = nil

    if logged_in?

        response = RestClient.get "https://api.themoviedb.org/3/discover/movie?api_key=8593f125d9ede49fe34d715af7003c5f&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&primary_release_date.gte=2018-06-15&primary_release_date.lte=2018-08-01"
        json = JSON.parse(response.body)

          @movies = json["results"].map do |result|

          {
            title: result["title"],
            poster_path: result["poster_path"],
            overview: result["overview"],
            release_date: result["release_date"],
            genres: result["genre_ids"].join(", "),
            apinum: result["id"]
          }


      end
    else
      @movies = Movie.all.order("created_at DESC")
    end
    #mediaocean.com/recent_reviews
  end

  def new
    @movie = Movie.new(title: params[:title], release_date: params[:release_date], genres: params[:genres], poster_path: params[:poster_path], apinum: params[:apinum], overview: params[:overview])
  end

  def index
    @movies = nil

    if params[:search]

        response = RestClient.get "https://api.themoviedb.org/3/search/movie?api_key=8593f125d9ede49fe34d715af7003c5f&language=en-US&query="+"#{params[:search]}"+"&page=1&include_adult=false"
        json = JSON.parse(response.body)

          @movies = json["results"].map do |result|

          {
            title: result["title"],
            poster_path: result["poster_path"],
            overview: result["overview"],
            release_date: result["release_date"],
            genres: result["genre_ids"].join(", "),
            apinum: result["id"]
          }


      end
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
