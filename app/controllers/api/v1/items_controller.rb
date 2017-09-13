class Api::V1::ItemsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_item, only: [:show, :item, :destroy]

  def index
    render json: Item.all
  end

  def show
    render json: @item
  end

  def create
    render json: Item.create(item_params)
  end

  def update
    render json: @item.update(item_params)
  end

  def destroy
    render json: @item.destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
