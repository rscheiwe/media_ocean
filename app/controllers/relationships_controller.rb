class RelationshipsController < ApplicationController

  def new
  end

  def create
    @relationship = current_user.active_relationships.build(followed_id: params[:followed_id])
    if @relationship.save
      redirect_to user_path(current_user)
    else
    end
  end

  def show
  end

end
