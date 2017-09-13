class SearchController < ApplicationController
  def index
    @locations = Location.for_user(params[:zipcode])
  end
end
