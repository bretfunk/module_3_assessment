class SearchController < ApplicationController
  def index
    @zipcode = params[:zipcode]
    @locations = Location.for_user(@zipcode)
  end
end
