require 'rails_helper'

RSpec.describe 'User can make a reservation', type: :feature do
  scenario 'they click checkout in the cart and the reservation is made' do
    user = create(:user)
    business = create(:business)
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

    find('#occupancy').find(:xpath, 'option[2]').select_option
    fill_in :starting_date, with: "08/30/2016"
    fill_in :end_date, with: "09/05/2016"

    click_on "Book Me"
    click_button 'Complete My Booking'

    expect(page).to eq orders_path(Order.last)

    within('.flash-success') do
      expect(page).to have_content "Your order has been placed!"
    end

    expect(page).to have_content "Order Details"
    expect(page).to have_content "Order ID: #{Order.last.id}"
  end
end
