class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    if params[:item_id]
      item = Item.find(params[:item_id])
      users = item.users 
    else
      users = User.all 
    end
    render json: users, include: :items
  end
  
  def show
    user = User.find_by(id: params[:id])
    if !user
      render_not_found_response
    else
      render json: user, include: :items
    end 
  end

  private

  def render_not_found_response
    render json: { error: "User not found" }, status: :not_found
  end

end
