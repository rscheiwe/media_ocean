class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :delete]
  before_action :new_user, only: [:new]

  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
      @users_search = @users.map {|user| user_path(user)}
    else
      @users = User.all.order("created_at DESC")
    end
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    # @followings =  Relationship.select {|follower| follower.followed_id == current_user.id}
    @followings = @user.passive_relationships.map { |rel| rel.follower }
  end

  private

  def new_user
    @user = User.new
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :profile_pic, :bio, :password_confirmation)
  end

end
