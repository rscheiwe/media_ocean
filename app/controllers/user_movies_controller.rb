class UserMoviesController < ApplicationController

  def index
  end

  def new
  end

  def create
    # {
    #   title: result["title"],
    #   poster_path: result["poster_path"],
    #   overview: result["overview"],
    #   release_date: result["release_date"],
    #   genres: result["genre_ids"].join(", "),
    #   apinum: result["id"]
    # }
    # @movie = Movie.new(params)
    # @found = Movie.find_by(apinum: @movie.apinum)
    # if @found == nil
    #   @movie.save
    # end
    @usermovie = current_user.user_movies.build(movie_id: params[:movie_id], seen: params[:seen])
    if @usermovie.save
      redirect_to user_path(current_user)
    else
    end
  end

  def edit
  end

  def update
  	@usermovie = UserMovie.find(params[:id])
  	@usermovie.update(seen: params[:seen])
  	if @usermovie.save
  		redirect_to user_path(current_user)
  	else
  		redirect_to user_path(current_user)
  	end
  end


end
