require 'rails_helper'

RSpec.describe 'User must login before checking out', type: :feature do
  scenario 'they cannot checkout in the cart until they are logged in' do
    user = create(:user)
    business = create(:business, user: user)
    location = create(:location) do |loc|
      loc.properties.create(attributes_for(:property, business_id: business.id))
    end
    property = location.properties.first

    visit property_path(property, business_name: property.business.slug)

    expect(page).to have_content("Cart Items: 0")

    find('#booking_occupancy').find(:xpath, 'option[1]').select_option
    fill_in 'booking[starting_date]', with: "08/30/2016"
    fill_in 'booking[end_date]', with: "09/05/2016"

    click_on "Book Me"

    expect(page).to have_content("Cart Items: 1")
    expect(page).to have_no_content("Book Reservations")

    within('#login-or-create-account') do
      expect(page).to have_content("Login or Create Account to Checkout")
      click_on "Login or Create Account to Checkout"
    end

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    within('.login-form') do
      click_on "Login"
    end

    expect(current_path).to eq cart_path
    expect(page).to have_link("Logout")
    expect(page).not_to have_link("Login")
    expect(page).to have_button("Complete My Booking")
    within('.flash-success') do
      expect(page).to have_content "Successfully logged in as #{user.username}"
    end
  end
end
