require 'rails_helper'

feature "BestBuy Store Lookup" do
  it "returns stores with valid zipcode" do
    visit "/"
    fill_in "zipcode", with: "80202"
    click_on "Search"

    expect(current_path).to eq("/search")
    expect(page).to have_content("25 Miles")
    #expect(page).to have_content("17 Total Stores")
    expect(page).to have_css(".store")
    expect(page).to have_css(".long_name")
    expect(page).to have_css(".city")
    expect(page).to have_css(".distance")
    expect(page).to have_css(".phone")
    expect(page).to have_css(".type")
  end
end


