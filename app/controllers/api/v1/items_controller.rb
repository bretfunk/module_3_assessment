class Api::V1::ItemsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_item, only: [:show]

  def index
    render json: Item.all
  end

  def show
    render json: @item
  end

  def create
    render json: Item.create(item_params)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
