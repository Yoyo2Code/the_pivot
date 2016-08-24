require 'rails_helper'

RSpec.describe 'Platform admin can approve or decline pending businesses', type: :feature do
  scenario 'they click approve and the business status changes to active' do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit new_business_path

    fill_in 'business[name]', with: 'Yoseph & Co.'
    fill_in 'business[image_url]', with: 'http://people.turing.io/assets/students/dj_greenfield-572acd74ca15fcc9eff531f092d5e234.jpg'
    click_button 'Submit New Business Application'

    user2 = create(:user, username: "David", role: 2)
    page.set_rack_session(user_id: user2.id)

    visit dashboard_path

    click_on "Manage All Businesses"

    expect(Business.first.status).to eq "pending"
    expect(page).to have_content 'Yoseph & Co.'
    expect(page).to have_css("img[src*='http://people.turing.io/assets/students/dj_greenfield-572acd74ca15fcc9eff531f092d5e234.jpg']")

    click_on "Approve"

    expect(Business.first.status).to eq "active"
    expect(current_path).to eq platform_admin_businesses_path

    within('.flash-success') do
      expect(page).to have_content "Business has been activated!"
    end

    within('#pending-businesses') do
      expect(page).to have_content "There are no pending businesses"
    end
  end

  scenario 'they click deny and the business is deleted from the database' do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit new_business_path

    fill_in 'business[name]', with: 'Yoseph & Co.'
    fill_in 'business[image_url]', with: 'http://people.turing.io/assets/students/dj_greenfield-572acd74ca15fcc9eff531f092d5e234.jpg'
    click_button 'Submit New Business Application'

    user2 = create(:user, username: "David", role: 2)
    page.set_rack_session(user_id: user2.id)

    visit dashboard_path

    click_on "Manage All Businesses"


    expect(Business.count).to eq 1
    expect(page).to have_content 'Yoseph & Co.'
    expect(page).to have_css("img[src*='http://people.turing.io/assets/students/dj_greenfield-572acd74ca15fcc9eff531f092d5e234.jpg']")

    click_on "Deny"

    expect(Business.count).to eq 0
    expect(current_path).to eq platform_admin_businesses_path

    within('.flash-success') do
      expect(page).to have_content "Business successfully deleted."
    end

    within('#pending-businesses') do
      expect(page).to have_content "There are no pending businesses"
    end
  end
end
