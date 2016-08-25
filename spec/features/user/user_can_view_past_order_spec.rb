require 'rails_helper'

RSpec.feature "User can view a past order" do
  scenario "they can see an individual past order" do
    user = create(:user)
    business = create(:business, user: user)
    location = create(:location) do |loc|
      loc.properties.create(attributes_for(:property, business_id: business.id))
    end
    property = location.properties.first

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    within('.login-form') do
      click_on "Login"
    end

    visit property_path(property, business_name: property.business.slug)

    find('#booking_occupancy').find(:xpath, 'option[2]').select_option
    fill_in 'booking[starting_date]', with: "08/30/2016"
    fill_in 'booking[end_date]', with: "09/05/2016"

    click_on "Book Me"
    click_button 'Complete My Booking'

    order = Order.last

    expect(page).to have_content "Order ##{order.id} Details"
    expect(page).to have_content "Name"
    expect(page).to have_content "Trump Tower"
    expect(page).to have_content "Description"
    expect(page).to have_content "Small rooms"
    expect(page).to have_content "Total Guests"
    expect(page).to have_content "2"
    expect(page).to have_content "Check-In"
    expect(page).to have_content "08/30/2016"
    expect(page).to have_content "Check-Out"
    expect(page).to have_content "09/05/2016"
    expect(page).to have_content "Total Cost"
    expect(page).to have_content "$120,000.00"
    expect(page).to have_content "Status"
    expect(page).to have_content "ordered"
    expect(page).to have_content "Order Submitted On:"
    expect(page).to have_content "Order Updated On:"
  end
end
