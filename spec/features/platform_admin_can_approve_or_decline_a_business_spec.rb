require 'rails_helper'

RSpec.describe 'Platform admin can approve or decline pending businsses', type: :feature do
  scenario 'they click approve and the business status changes to active' do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit new_business_path

    fill_in 'business[name]', with: 'Yoseph & Co.'
    fill_in 'business[image_url]', with: 'http://people.turing.io/assets/students/dj_greenfield-572acd74ca15fcc9eff531f092d5e234.jpg'
    click_button 'Submit New Business Application'

    user = create(:user, username: "David", role: 2)
    page.set_rack_session(user_id: user.id)

    visit dashboard_path

    click_on "View Pending Businesses"

    expect(Business.first.status).to eq "pending"
    expect(page).to have_content 'Yoseph & Co.'
    expect(page).to have_css("img[src*='http://people.turing.io/assets/students/dj_greenfield-572acd74ca15fcc9eff531f092d5e234.jpg']")

    click_on "Approve"

    expect(Business.first.status).to eq "active"
    expect(current_path).to eq businesses_pending_path
    expect(page).to have_content "Business successfully approved!"
  end

  scenario 'they click deny and the business is deleted from the database' do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit new_business_path

    fill_in 'business[name]', with: 'Yoseph & Co.'
    fill_in 'business[image_url]', with: 'http://people.turing.io/assets/students/dj_greenfield-572acd74ca15fcc9eff531f092d5e234.jpg'
    click_button 'Submit New Business Application'

    user = create(:user, username: "David", role: 2)
    page.set_rack_session(user_id: user.id)

    visit dashboard_path

    click_on "View Pending Businesses"

    expect(page).to have_content 'Yoseph & Co.'
    expect(page).to have_css("img[src*='http://people.turing.io/assets/students/dj_greenfield-572acd74ca15fcc9eff531f092d5e234.jpg']")

    click_on "Deny"
  end
end
