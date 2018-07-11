class UserMoviesController < ApplicationController

 def create
   byebug
    @usermovie = current_user.user_movies.build(movie_id: params[:movie_id], seen: params[:seen])
    if @usermovie.save
      redirect_to user_path(current_user)
    else
    end
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
