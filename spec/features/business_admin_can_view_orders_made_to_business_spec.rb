require 'rails_helper'

RSpec.feature "Business admin can view orders made to business" do
  scenario "they can see a list of orders made to their business" do
    user1 = create(:user, username: "yoseph")
    user2 = create(:user, username: "jason")
    user3 = create(:user, username: "david", role: 1)
    business = create(:business, user: user3)
    location = create(:location)
    property1 = create(:property, business: business, location: location)
    property2 = create(:property, title: "Turing", business: business, location: location)
    order1 = create(:order, user: user1)
    order2 = create(:order, user: user2)
    create(:reservation, order: order1, property: property1)
    create(:reservation, order: order2, property: property2)
    page.set_rack_session(user_id: user3.id)

    visit dashboard_path

    click_on "View Business Orders"

    expect(current_path).to eq admin_orders_path
    expect(page).to have_content("Acme")
    expect(page).to have_content("Turing")
  end
end
