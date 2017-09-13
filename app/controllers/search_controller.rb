class SearchController < ApplicationController
  def index
    zipcode = params[:search]
    #I have no idea why this still says search and not zipcode
    @conn = Faraday.get("https://api.bestbuy.com/v1/stores(postalCode=55423)?format=json&show=storeId,storeType,name,city,region&apiKey=#{ENV['API_KEY']}")
    byebug
  end
end
