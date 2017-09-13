class Api::V1::ItemsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_item, only: [:show, :destroy]

  def index
    render json: Item.all, status: 200
  end

  def show
    render json: @item, status: 200
  end

  def create
    render json: Item.create(item_params), status: 201
  end

  def destroy
    render json: @item.destroy, status: 204
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
