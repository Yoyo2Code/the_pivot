require 'rails_helper'

RSpec.describe 'Visitor can see all locations', type: :feature do
  scenario 'they see locations by default' do
    location = create(:location)

    visit root_path

    within('#locations') do
      expect(page).to have_link(location.city)
    end
  end

  scenario 'they click on location to be taken to page' do
    location = create(:location)
    create(:property, location: location)

    visit root_path

    click_link location.city

    expect(current_path).to eq("/locations/#{location.slug}")
  end
end
