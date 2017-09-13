class SearchController < ApplicationController
  def index
    zipcode = params[:search]
    zipcode = "80202"
    @conn = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=2&apiKey=#{ENV['API_KEY']}")
    @response = JSON.parse(@conn.body, symbolize_names: true)[:stores]
    @locations = @response.map do |raw_location|
      Location.new(raw_location)
    end
  end
end
