require 'rails_helper'

feature "testing capybara and factorygirl works" do
  it "does capybara and factorygirl things" do
    item = create(:item)
    visit "/"
    click_on "Items"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Items")
    expect(page).to have_content(item.name)
  end
end
