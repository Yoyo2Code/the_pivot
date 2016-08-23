require 'rails_helper'

RSpec.feature "visitor sees business owner" do
  scenario "they can see all properties belonging to an owner" do
    location = create(:location, city: "New York")
    business = create(:business)
    create(:property, location: location, business: business)

    visit "/acme"

    expect(page).to have_content("Acme")
    expect(page).to have_content("Trump Tower")
    expect(page).to have_content("Small rooms")
    expect(page).to have_content("Price Per Guest: $10,000.00")
    expect(page).to have_content("Max Occupancy: 4")
    expect(page).to have_css("img[src*='http://img09.deviantart.net']")
  end
end
