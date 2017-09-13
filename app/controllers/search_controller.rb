class SearchController < ApplicationController
  def index
    @zipcode = params[:search]
    @zipcode = "80202"
    #^^ for testing
    @locations = @response.map do |raw_location|
      Location.new(raw_location)
    end
  end
end
