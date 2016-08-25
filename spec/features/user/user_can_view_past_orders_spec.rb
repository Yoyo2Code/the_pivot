require 'rails_helper'

RSpec.describe "User can see view past orders", type: :feature do
  scenario "they login and see a link to view past orders" do
    user = create(:user)
    order = create(:order, user_id: user.id)
    page.set_rack_session(user_id: user.id)

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    within('.login-form') do
      click_on "Login"
    end

    expect(page).to have_link "View My Past Orders"

    click_on "View My Past Orders"

    expect(current_path).to eq orders_path
  end

  scenario "they can see all past orders" do
    user = create(:user)
    order = create(:order, user_id: user.id)
    page.set_rack_session(user_id: user.id)

    visit orders_path

    expect(page).to have_content("Order History")
    expect(page).to have_content("ordered")
    expect(page).to have_content("Status")
    expect(page).to have_link("View Order Details")
    expect(page).to have_content(order.id.to_s)
    expect(page).to have_content("Date Created")
  end

end
