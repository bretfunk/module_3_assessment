require 'rails_helper'

describe "Best Buy Service" do
  it "returns things via API" do
    @conn = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=longName,city,distance,phone,storeType&pageSize=2&apiKey=#{ENV['API_KEY']}")
    response = JSON.parse(@conn.body)
    expect(response['total']).to eq(17)
    expect(response['stores'].first).to have_key('longName')
    expect(response['stores'].first).to have_key('city')
    expect(response['stores'].first).to have_key('distance')
    expect(response['stores'].first).to have_key('phone')
    expect(response['stores'].first).to have_key('storeType')



  end
end


