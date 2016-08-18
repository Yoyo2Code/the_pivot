require 'rails_helper'

RSpec.feature "visitor can see all properties in a city" do
  scenario "they visit a city name path and see properties in that city" do

    location = create(:location, city: "New York")
    business = create(:business)
    create(:property, location: location, business: business)
    create(:property, title: "Little Tiny House",
                      description: "Small people",
                      price_per_guest: 10.00,
                      image_path: "https://c2.staticflickr.com/4/3597/5790914660_1733d9253f_b.jpg",
                      max_occupancy: 2,
                      location: location,
                      business: business)

    visit "/new-york"

    expect(page).to have_content("Trump Tower")
    expect(page).to have_content("Small rooms")
    expect(page).to have_content("Price Per Guest: $10,000.00")
    expect(page).to have_content("Max Occupancy: 4")
    expect(page).to have_css("img[src*='http://img09.deviantart.net']")

    expect(page).to have_content("Little Tiny House")
    expect(page).to have_content("Small people")
    expect(page).to have_content("Price Per Guest: $10.00")
    expect(page).to have_content("Max Occupancy: 2")
    expect(page).to have_css("img[src*='https://c2.staticflickr.com/4/3597/5790914660_1733d9253f_b.jpg']")
  end
end
