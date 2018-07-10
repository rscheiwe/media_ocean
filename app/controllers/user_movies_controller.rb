class UserMoviesController < ApplicationController

 def create
    @usermovie = current_user.user_movies.build(movie_id: params[:movie_id], seen: params[:seen])
    if @usermovie.save
      redirect_to user_path(current_user)
    else
    end
  end

end