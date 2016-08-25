require 'rails_helper'

RSpec.feature "User can cancel an order" do
  scenario "they click cancel and see that the order is cancelled" do
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

    within('#cancel-order') do
      click_on "Cancel Order"
    end

    order = Order.last

    expect(current_path).to eq order_path(order)
    expect(page).to have_content("cancelled")
  end
end
