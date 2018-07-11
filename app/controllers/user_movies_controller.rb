class UserMoviesController < ApplicationController

 def create
    if Movie.find_by(apinum: params[:apinum])
      @movie = Movie.find_by(apinum: params[:apinum])
      UserMovie.create(movie_id: @movie.id, user_id: current_user.id)
    else
      @movie = Movie.new(release_date: params[:release_date], genres: params[:genres], poster_path: params[:poster_path], overview: params[:overview], apinum: params[:apinum], title: params[:title])
      @movie.save
      UserMovie.create(movie_id: @movie.id, user_id: current_user.id, seen: params[:seen])
    end
    redirect_to user_path(current_user)
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
