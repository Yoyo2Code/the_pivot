require 'rails_helper'

RSpec.describe 'Visitor can see all locations', type: :feature do
  scenario 'they see locations by default on root' do
    location = create(:location, city: "denver")

    visit more_options_path

    within('#locations') do
      expect(page).to have_css("##{location.city}")
    end
  end
end
