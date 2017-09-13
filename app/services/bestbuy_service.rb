class BestbuyService
  attr_reader :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
    @conn = Faraday.new("https://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.locations(zipcode)
    new(zipcode).locations
  end

  def locations
    get_url("/v1/stores(area(#{zipcode},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=2&apiKey=#{ENV['API_KEY']}")[:stores]
  end

  def get_url(url)
    parse(@conn.get(url))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  #@conn = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{@zipcode},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=2&apiKey=#{ENV['API_KEY']}")
  #@quantity = JSON.parse(@conn.body, symbolize_names: true)[:total]
  #@response = JSON.parse(@conn.body, symbolize_names: true)[:stores]
end

