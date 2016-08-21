require 'rails_helper'

RSpec.feature 'user can delete items from cart' do
  scenario 'delete item from a cart with 1 item' do

    business = create(:business)

    location = create(:location) do |location|
      location.properties.create(attributes_for(:property,
                                           business_id: business.id))
      page.set_rack_session(cart: { Property.first.id.to_s => { starting_date: "08/15/2016",
                                end_date: "09/01/2016",
                                occupancy: 2 }})
    end

    visit cart_path

    expect(page).to have_content("Cart Items: 1")

    click_on("Remove")

    expect(current_path).to eq '/cart'

    expect(page).to have_content("Successfully removed")
    expect(page).to have_content("Cart Items: 0")
  end

    xscenario 'user can delete multiple items from cart'do
    location = create(:location) do |location|
      location.items.create(attributes_for(:property))
    end

    visit items_path
    click_on("Add to Cart")
    click_on("Add to Cart")
    click_on("Add to Cart")

    expect(page).to have_content("Cart Items: 3")
  end
end
