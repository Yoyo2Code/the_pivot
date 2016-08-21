require 'rails_helper'

RSpec.feature 'user can delete items from cart' do
  scenario 'delete item from a cart with 1 item' do
    business = create(:business)

    create(:location) do |loc|
      loc.properties.create(attributes_for(
                                            :property,
                                            business_id: business.id
                                           )
                            )
    end

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

    click_on("Remove")

    expect(current_path).to eq '/cart'

    expect(page).to have_content("Successfully removed")
    expect(page).to have_content("Cart Items: 0")
    expect(page).to have_content("Your Cart is Empty")
  end

  scenario 'user can delete multiple items from cart' do
    business = create(:business)

    create(:location) do |loc|
      loc.properties.create(attributes_for(
                                            :property,
                                            business_id: business.id
                                           )
                            )

      loc.properties.create(attributes_for(:property,

                                           title: "Disneyland",
                                           business_id: business.id
                                           )
                            )
    end

    property_1 = Property.first
    property_2 = Property.second

    page.set_rack_session(
                          cart:
                            {
                              property_1.id.to_s =>
                              {
                                starting_date: "08/15/2016",
                                end_date: "09/01/2016",
                                occupancy: 2 },
                              property_2.id.to_s =>
                              {
                                starting_date: "08/15/2016",
                                end_date: "09/01/2016",
                                occupancy: 2
                              }
                            }
                          )

    visit cart_path

    expect(page).to have_content("Trump Tower")
    expect(page).to have_content("Disneyland")
    expect(page).to have_content("Cart Items: 2")

    within("#cart-item-#{property_1.id}") do
      click_button "Remove"
    end

    expect(page).to have_content("Disneyland")
    expect(page).to have_no_content("Trump Tower")
    expect(page).to have_content("Cart Items: 1")
    expect(page).to have_no_content("Your Cart is Empty")

    within("#cart-item-#{property_2.id}") do
      click_button "Remove"
    end

    expect(page).to have_no_content("Disneyland")
    expect(page).to have_no_content("Trump Tower")
    expect(page).to have_content("Cart Items: 0")
    expect(page).to have_content("Your Cart is Empty")
  end
end
