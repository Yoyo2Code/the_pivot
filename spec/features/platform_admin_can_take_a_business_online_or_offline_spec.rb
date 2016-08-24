require 'rails_helper'

RSpec.describe 'Platform admin can take a business online or offline', type: :feature do
  xscenario 'they can view all non-pending businesses and see their status' do
    user = create(:user)
    user2 = create(:user, username: "David", role: 2)
    business1 = create(
      :business,
      status: 'inactive',
      user: user)
    business2 = create(
      :business,
      name: "Yoseph & Co.",
      status: 'active',
      image_url: 'http://img08.deviantart.net/08ce/i/2012/215/c/b/serenity_logo_svg_by_xdante-d59ogy3.png',
      user: user2)
    page.set_rack_session(user_id: user.id)

    page.set_rack_session(user_id: user2.id)

    visit dashboard_path

    click_on "Manage All Businesses"

    expect(page).to have_content "Manage All Businesses"

    expect(page).to have_content "Acme"
    expect(page).to have_css("img[src*='https://avatars1.githubusercontent.com/u/7934292?v=3&s=200']")
    expect(page).to have_content "Inactive"

    expect(page).to have_content 'Yoseph & Co.'
    expect(page).to have_css("img[src*='http://img08.deviantart.net/08ce/i/2012/215/c/b/serenity_logo_svg_by_xdante-d59ogy3.png']")
    expect(page).to have_content "Active"
  end

  xscenario "they should not see pending businesses" do
    user = create(:user, role: 2)
    business1 = create(:business, user: user)

    visit businesses_statuses_path

    expect(page).to have_no_content("Acme")
    expect(page).to have_content("No Live Businesses")
  end

  xscenario 'they can make an inactive business active' do


    click_on "Activate"

    expect(business1.status).to eq "inactive"

    expect(business2.status).to eq "active"
    expect(current_path).to eq businesses_pending_path
    expect(page).to have_content "Business successfully activated!"

  end

  xscenario 'they can make an active business inactive' do

    click_on "Deactivate"

    expect(business2.status).to eq "active"
    expect(page).to have_content "Active"
    expect(page).to have_content "Business successfully deactivated!"
  end

  xscenario 'they cannot see an inactive business on the business index page' do
  end

  xscenario 'they can see a newly activated business on the business index page' do
  end
end
