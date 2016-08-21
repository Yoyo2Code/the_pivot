require 'rails_helper'

RSpec.feature "visitor can see individual property page" do
  scenario "visitor sees property page" do

    location = create(:location)
    business = create(:business)
    property = create(:property,
                      business: business,
                      location: location)

    visit "/acme/#{property.id}"

    expect(page).to have_content("Trump Tower")
    expect(page).to have_content("Small rooms")
    expect(page).to have_content("Price Per Guest: $10,000.00")
    expect(page).to have_content("Max Occupancy: 4")
    expect(page).to have_content("Acme")
    expect(page).to have_content("New York")
    expect(page).to have_css("img[src*='http://img09.deviantart.net']")
  end
end
