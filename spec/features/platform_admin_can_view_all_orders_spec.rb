require 'rails_helper'

RSpec.feature "Platform admin can view all orders" do
  scenario "they can see a list of all users orders" do
    user1 = create(:user, username: "yoseph")
    user2 = create(:user, username: "jason", role: 1)
    user3 = create(:user, username: "david", role: 2)
    business1 = create(:business, name: "Fancy", user: user2)
    business2 = create(:business, user: user3)
    location = create(:location)
    property1 = create(:property, business: business1, location: location)
    property2 = create(:property, title: "Turing", business: business2, location: location)
    order1 = create(:order, user: user1)
    order2 = create(:order, user: user2)
    create(:reservation, order: order1, property: property1)
    create(:reservation, order: order2, property: property2)
    page.set_rack_session(user_id: user3.id)

    visit dashboard_path

    click_on "View All Orders"

    expect(current_path).to eq admin_orders_path
    expect(page).to have_content("Acme")
    expect(page).to have_content("Turing")
  end
end
