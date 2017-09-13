class Api::V1::ItemsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: Item.all
  end
end
