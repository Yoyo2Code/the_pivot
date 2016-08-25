require 'rails_helper'

RSpec.describe 'Platform admin can manage a business', type: :feature do
  scenario 'they can view all non-pending businesses and see their status' do
    user = create(:user)
    user2 = create(:user, username: "David", role: 2)
    create(
    :business,
    status: 'inactive',
    user: user
    )
    create(
    :business,
    name: "Yoseph & Co.",
    status: 'active',
    image_url: 'http://img08.deviantart.net/08ce/i/2012/215/c/b/serenity_logo_svg_by_xdante-d59ogy3.png',
    user: user2
    )
    page.set_rack_session(user_id: user2.id)

    visit dashboard_path

    click_on "Manage All Businesses"

    expect(page).to have_content "Existing Businesses"

    expect(page).to have_content "Acme"
    expect(page).to have_css("img[src*='https://avatars1.githubusercontent.com/u/7934292?v=3&s=200']")
    expect(page).to have_content "Inactive"

    expect(page).to have_content 'Yoseph & Co.'
    expect(page).to have_css("img[src*='http://img08.deviantart.net/08ce/i/2012/215/c/b/serenity_logo_svg_by_xdante-d59ogy3.png']")
    expect(page).to have_content "Active"
  end

  scenario "they should see pending businesses seperate from existing ones" do
    user = create(:user, role: 2)
    create(:business, user: user)
    page.set_rack_session(user_id: user.id)

    visit platform_admin_businesses_path

    within('#existing-businesses') do
      expect(page).to have_no_content("Acme")
    end

    expect(page).to have_content("There are no existing businesses")
  end
end
