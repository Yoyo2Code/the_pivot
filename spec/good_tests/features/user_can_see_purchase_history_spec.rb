require 'rails_helper'

RSpec.describe "user can see purchase history", type: :feature do
  scenario "user can see order index" do
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
