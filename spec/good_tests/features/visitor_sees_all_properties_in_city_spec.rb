require 'rails_helper'

RSpec.feature "visitor can see all properties in a city" do
  scenario "they visit a city name path and see properties in that city" do
    create(:business)
    property = create(:property)
    create(:property, title:, description:, price_per_guest:, image_path:, max_occupancy:)

    visit "/new-york"

    expect(page).to have_content("Trump Tower")
    expect(page).to have_content("Small rooms")
    expect(page).to have_content("Price Per Guest: $10,000.00")
    expect(page).to have_content("Max Occupancy: 4")

    expect(page).to have_css("img[src*='http://img09.deviantart.net']")
  end
end
