require 'rails_helper'

RSpec.describe 'Platform admin can view pending businesses', type: :feature do
  scenario 'they click a link on their dashboard and see pending businesses' do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit new_business_path

    fill_in 'business[name]', with: 'Yoseph & Co.'
    fill_in 'business[image_url]', with: 'http://people.turing.io/assets/students/dj_greenfield-572acd74ca15fcc9eff531f092d5e234.jpg'
    click_button 'Submit New Business Application'

    user = create(:user, username: "David", role: 2)
    page.set_rack_session(user_id: user.id)

    visit dashboard_path

    click_on "Manage All Businesses"

    within('#pending-businesses') do
      expect(page).to have_content 'Yoseph & Co.'
      expect(page).to have_css("img[src*='http://people.turing.io/assets/students/dj_greenfield-572acd74ca15fcc9eff531f092d5e234.jpg']")
      expect(page).to have_button "Approve"
      expect(page).to have_button "Deny"
    end
  end

  scenario "there are no pending businesses and they see a message" do
    user = create(:user, username: "David", role: 2)
    page.set_rack_session(user_id: user.id)

    visit dashboard_path

    click_on "Manage All Businesses"

    within('#pending-businesses') do
      expect(page).to have_content 'There are no pending businesses.'
    end

    within('.return-to-dashboard') do
      click_on "Return to My Dashboard"
    end

    expect(current_path).to eq dashboard_path
  end
end
