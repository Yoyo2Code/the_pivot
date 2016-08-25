require 'rails_helper'

RSpec.describe 'Visitor can see all locations', type: :feature do
  scenario 'they see locations by default on root' do
    location = create(:location)

    visit root_path

    within('#locations') do
      expect(page).to have_link(location.city)
    end
  end

  scenario 'they can access individual locations' do
    property = create(:property)

    visit root_path

    click_link property.location.city

    expect(current_path).to eq("/locations/#{property.location.slug}")
  end
end
