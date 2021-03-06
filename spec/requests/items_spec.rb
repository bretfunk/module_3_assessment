#When I send a GET request to `/api/v1/items`
#I receive a 200 JSON response containing all items
#And each item has an id, name, description, and image_url but not the created_at or updated_at

#When I send a GET request to `/api/v1/items/1`
#I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at

#When I send a DELETE request to `/api/v1/items/1`
#I receive a 204 JSON response if the record is successfully deleted

#When I send a POST request to `/api/v1/items` with a name, description, and image_url
#I receive a 201 JSON  response if the record is successfully created
#And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at

#* Verify that your non-GET requests work using Postman or curl. (Hint: `ActionController::API`). Why doesn't the default `ApplicationController` support POST and PUT requests?
require 'rails_helper'

describe "Items API" do
  it "returns all items" do
    create_list(:item, 3)
    get "/api/v1/items"
    expect(response).to be_success
    expect(response).to have_http_status(200)
    items = JSON.parse(response.body)
    item = items.first
    expect(items.count).to eq(3)
    expect(item['id']).to eq(1)
    expect(item['name']).to eq("MyName")
    expect(item['description']).to eq("MyDescription")
    expect(item['image_url']).to eq("www.google.com")
    expect(item).to_not have_key('created_at')
    expect(item).to_not have_key('updated_at')
  end

  it "returns one item" do
    item = create(:item)
    get "/api/v1/items/#{item.id}"
    expect(response).to be_success
    expect(response).to have_http_status(200)
    result = JSON.parse(response.body)
    expect(result['id']).to eq(1)
    expect(result['name']).to eq("MyName")
    expect(result['description']).to eq("MyDescription")
    expect(result['image_url']).to eq("www.google.com")
    expect(result).to_not have_key('created_at')
    expect(result).to_not have_key('updated_at')
  end

  it "creates a new item" do
    create_list(:item, 3)
    get "/api/v1/items"
    expect(response).to be_success
    expect(response).to have_http_status(200)
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)

    item_params = {name: "tourniquet", description: "best item ever", image_url: "www.google.com"}
    post "/api/v1/items", params: {item: item_params}
    expect(response).to be_success
    expect(response).to have_http_status(201)
    result = JSON.parse(response.body)
    expect(result['name']).to eq(item_params[:name])
    expect(result['description']).to eq(item_params[:description])
    expect(result['image_url']).to eq(item_params[:image_url])
    expect(result).to_not have_key('created_at')
    expect(result).to_not have_key('updated_at')

    get "/api/v1/items"
    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.count).to eq(4)
  end

  it "deletes an item" do
    item = create(:item)
    create_list(:item, 3)

    get "/api/v1/items"
    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.count).to eq(4)

    delete "/api/v1/items/#{item.id}"
    expect(response).to be_success
    expect(response).to have_http_status(204)

    get "/api/v1/items"
    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
  end

end
