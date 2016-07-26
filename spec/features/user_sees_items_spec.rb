require 'rails_helper'

RSpec.feature "User sees items" do
  scenario "user views items when not logged in" do

    item = Item.first
    visit items_path

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price)
    expect(page).to have_css("img[src*='http://img09.deviantart.net']")
  end
end
