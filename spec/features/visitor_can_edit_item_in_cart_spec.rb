require 'rails_helper'

RSpec.feature 'Visitor can edit items in cart' do
  scenario 'they click edit and see the show page for a property' do
    business = create(:business)
    slug = business.slug
    create(:location) do |loc|
      loc.properties.create(attributes_for(:property, business_id: business.id))
    end
    property = Property.last
    page.set_rack_session(
                          cart:
                          {
                            Property.first.id.to_s =>
                            {
                              starting_date: "08/15/2016",
                              end_date: "09/01/2016",
                              occupancy: 2
                            }
                          }
                         )

    visit cart_path

    expect(page).to have_content("Cart Items: 1")

    within(".panel-body") do
      expect(page).to have_content("Check-In: 08/15/2016")
      expect(page).to have_content("Check-Out: 09/01/2016")
      expect(page).to have_content("Total Guests: 2")
    end

    click_on("Edit")

    expect(current_path).to eq property_path(property, business_name: slug)
    find('#booking_occupancy').find(:xpath, 'option[1]').select_option
    fill_in 'booking[starting_date]', with: "09/06/2016"
    fill_in 'booking[end_date]', with: "09/09/2016"

    click_on "Book Me"

    expect(current_path).to eq cart_path
    expect(page).to have_content("Cart Items: 1")

    within(".panel-body") do
      expect(page).to have_content("Check-In: 09/06/2016")
      expect(page).to have_content("Check-Out: 09/09/2016")
      expect(page).to have_content("Total Guests: 1")
    end
  end
end
