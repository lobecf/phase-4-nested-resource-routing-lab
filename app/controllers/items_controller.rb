class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    items = Item.all
    render json: items, include: :user
  end

  def show
    items = Item.find_by(id: params[:id])
    render json: items, include: :user
  end

  def create
    user = User.find_by(id: params[:user_id])
    item = Item.create!(item_params)
    render json: item, status: :created
  end

  private

  def render_not_found_response
    render json: { error: "#{exception.model} not found" }, status: :not_found
  end

  def item_params
    params.permit(:name, :description, :price, :user_id)
  end

end
