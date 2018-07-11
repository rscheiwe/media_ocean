class ReviewsController < ApplicationController
  before_action :authorized

  def new
	@review = Review.new
	@movie = Movie.find(params[:movie_id])
	@user = current_user.id	
  end

  def create
  	@review = Review.new(review_params)
  	@movie = Movie.find(review_params[:movie_id])
	@user = current_user.id	
  	if @review.save
  		redirect_to movie_path(@movie)
  	else
  		render :new
  	end
  end

  private
  def review_params
  	params.require(:review).permit(:content, :movie_id, :user_id, :rating)
  end
end
