require 'rails_helper'

RSpec.feature "User sees items" do
  scenario "a visitor can add an item to their cart" do

    Cart.new(nil)
    business = create(:business)
    location = create(:location) do |loc|
      loc.properties.create(attributes_for(:property, business_id: business.id))
    end
    property = location.properties.first

    visit property_path(property, business_name: property.business.slug)

    expect(page).to have_content("Cart Items: 0")

    find('#occupancy').find(:xpath, 'option[2]').select_option
    fill_in :starting_date, with: "08/30/2016"
    fill_in :end_date, with: "09/05/2016"

    click_on "Book Me"

    expect(page).to have_content("Cart Items: 1")

    click_link("Cart Items")

    expect(current_path).to eq('/cart')
    expect(page).to have_content(business.name)
    expect(page).to have_content(property.title)
    expect(page).to have_content(property.description)
    expect(page).to have_content("$20,000.00")
    expect(page).to have_content("Total Guests: 2")
    expect(page).to have_content("Check-In: 08/30/2016")
    expect(page).to have_content("Check-Out: 09/05/2016")
    expect(page).to have_css("img[src*='http://img09.deviantart.net']")
  end

  scenario "a visitor can add multiple items to their cart" do
    Cart.new(nil)
    business = create(:business)
    location = create(:location) do |loc|
      loc.properties.create(attributes_for(:property, business_id: business.id))
      loc.properties.create(attributes_for(:property, business_id: business.id, price_per_guest: 3000.0, max_occupancy: 6, title: "The Waldorf", description: "Nice rooms" ))
    end
    property = location.properties.first
    property2 = location.properties.last

    visit property_path(property, business_name: property.business.slug)

    expect(page).to have_content("Cart Items: 0")

    find('#occupancy').find(:xpath, 'option[2]').select_option
    fill_in :starting_date, with: "08/30/2016"
    fill_in :end_date, with: "09/05/2016"

    click_on "Book Me"

    visit property_path(property2, business_name: property.business.slug)

    expect(page).to have_content("Cart Items: 1")

    find('#occupancy').find(:xpath, 'option[2]').select_option
    fill_in :starting_date, with: "09/06/2016"
    fill_in :end_date, with: "09/09/2016"

    click_on "Book Me"

    expect(page).to have_content("Cart Items: 2")

    click_link("Cart Items")

    expect(current_path).to eq('/cart')
    expect(page).to have_content(property.title)
    expect(page).to have_content(property.description)
    expect(page).to have_content("$20,000.00")
    expect(page).to have_content("Total Guests: 2")
    expect(page).to have_content("Check-In: 08/30/2016")
    expect(page).to have_content("Check-Out: 09/05/2016")
    expect(page).to have_css("img[src*='http://img09.deviantart.net']")
    expect(page).to have_content(property2.title)
    expect(page).to have_content(property2.description)
    expect(page).to have_content("$6,000.00")
    expect(page).to have_content("Total Guests: 2")
    expect(page).to have_content("Check-In: 09/06/2016")
    expect(page).to have_content("Check-Out: 09/09/2016")
    expect(page).to have_css("img[src*='http://img09.deviantart.net']")
    expect(page).to have_content("$26,000.00")
  end

  scenario "a visitor can add multiple items to their cart from different businesses" do
    Cart.new(nil)
    business = create(:business)
    business2 = create(:business, name: "The Waldorf")
    location = create(:location) do |loc|
      loc.properties.create(attributes_for(:property, business_id: business.id))
      loc.properties.create(attributes_for(:property, business_id: business2.id, price_per_guest: 3000.0, max_occupancy: 6, title: "The Waldorf", description: "Nice rooms"))
    end
    property = location.properties.first
    property2 = location.properties.last

    visit property_path(property, business_name: property.business.slug)

    expect(page).to have_content("Cart Items: 0")

    find('#occupancy').find(:xpath, 'option[2]').select_option
    fill_in :starting_date, with: "08/30/2016"
    fill_in :end_date, with: "09/05/2016"

    click_on "Book Me"

    visit property_path(property2, business_name: property.business.slug)

    expect(page).to have_content("Cart Items: 1")

    find('#occupancy').find(:xpath, 'option[2]').select_option
    fill_in :starting_date, with: "09/06/2016"
    fill_in :end_date, with: "09/09/2016"

    click_on "Book Me"

    expect(page).to have_content("Cart Items: 2")

    click_link("Cart Items")

    expect(current_path).to eq('/cart')
    expect(page).to have_content(business.name)
    expect(page).to have_content(property.title)
    expect(page).to have_content(property.description)
    expect(page).to have_content("$20,000.00")
    expect(page).to have_content("Total Guests: 2")
    expect(page).to have_content("Check-In: 08/30/2016")
    expect(page).to have_content("Check-Out: 09/05/2016")
    expect(page).to have_css("img[src*='http://img09.deviantart.net']")
    expect(page).to have_content(business2.name)
    expect(page).to have_content(property2.title)
    expect(page).to have_content(property2.description)
    expect(page).to have_content("$6,000.00")
    expect(page).to have_content("Total Guests: 2")
    expect(page).to have_content("Check-In: 09/06/2016")
    expect(page).to have_content("Check-Out: 09/09/2016")
    expect(page).to have_css("img[src*='http://img09.deviantart.net']")
    expect(page).to have_content("$26,000.00")
  end

  scenario "visitor sees flash notice when adding item to cart" do
    Cart.new(nil)
    business = create(:business)
    location = create(:location) do |loc|
      loc.properties.create(attributes_for(:property, business_id: business.id))
    end
    property = location.properties.first

    visit property_path(property, business_name: property.business.slug)

    find('#occupancy').find(:xpath, 'option[2]').select_option
    fill_in :starting_date, with: "08/30/2016"
    fill_in :end_date, with: "09/05/2016"

    click_on "Book Me"

    within(".flash-success") do
      expect(page).to have_content("Successfully added booking to cart!")
    end
  end
end
