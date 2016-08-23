require 'rails_helper'

RSpec.feature "Business admin can update their properties" do
  scenario "they can see a list of properties and click edit" do
    user = create(:user, role: 1)
    business = create(:business, user: user)
    location = create(:location)
    create(:property, business: business, location: location)
    property = location.properties.first
    business_name = property.business.slug
    page.set_rack_session(user_id: user.id)

    visit dashboard_path

    click_on "My Properties"

    expect(page).to have_content "Acme"

    within('#edit-property') do
      click_on "Edit Property"
    end

    expect(current_path).to eq admin_edit_property_path(property, business_name: business_name)
  end

  scenario "they can edit a property and save those changes" do
    user = create(:user, role: 1)
    business = create(:business, user: user)
    location = create(:location)
    create(:property, business: business, location: location)
    property = location.properties.first
    page.set_rack_session(user_id: user.id)

    visit dashboard_path

    click_on "My Properties"

    within('#edit-property') do
      click_on "Edit Property"
    end

    fill_in "Title", with: "Turing"
    fill_in "Description", with: "Sleep and code"
    fill_in "Price Per Guest", with: 80
    fill_in "Max Occupancy", with: 6
    fill_in "Image Url", with: "http://people.turing.io/assets/students/dj_greenfield-572acd74ca15fcc9eff531f092d5e234.jpg"

    click_on "Save Changes"

    within('.flash-success') do
      expect(page).to have_content "Property successfully updated!"
    end

    expect(current_path).to eq property_path(property, business_name: property.business.slug)
    expect(page).to have_content "Turing"
    expect(page).to have_content("Sleep and code")
  end
end
