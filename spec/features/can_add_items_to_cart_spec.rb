require 'rails_helper'

RSpec.feature "User sees items" do
  scenario "a visitor can add an item to their cart" do

    # As a visitor
    # When I visit any page with an item on it
    cart = Cart.new(nil)
    category = create(:category) do |category|
      category.items.create(attributes_for(:item))
    end
    item = category.items.first
    visit items_path
    expect(page).to have_content("Cart Items: 0")
    # I should see a link or button for "Add to Cart"
    # When I click "Add to cart" for that item
    click_on("Add to Cart")
    expect(page).to have_content("Cart Items: 1")
    # And I click a link or button to view cart
    click_link("Cart Items")
    # And my current path should be "/cart"
    expect(current_path).to eq('/cart')
    # And I should see a small image, title, description and price for the item I just added
    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content("$10,000.00")
    expect(page).to have_css("img[src*='http://img09.deviantart.net']")
    # And there should be a "total" price for the cart that should be the sum of all items in the cart
    expect(page).to have_content(cart.total)

  end

  scenario "a visitor can add multiple items to their cart" do
    cart = Cart.new(nil)
    category = create(:category) do |category|
      category.items.create(attributes_for(:item))
    end

    item1 = category.items.first
    item2 = category.items.create(attributes_for(:item, title: "Robot Hand", description: "Cool ass hand", price: 3000.0, image_path: 'http://www.bulldozer-vfx.com/wp-content/uploads/2013/07/yyyyyyyyuu.jpg') )

    visit items_path

    expect(page).to have_content("Cart Items: 0")

    first(:button, "Add to Cart").click

    expect(page).to have_content("Cart Items: 1")

    all(:button, "Add to Cart")[1].click

    expect(page).to have_content("Cart Items: ")

    click_link("Cart Items")

    expect(current_path).to eq('/cart')

    expect(page).to have_content(item1.title)
    expect(page).to have_content(item1.description)
    expect(page).to have_content("$10,000.00")
    expect(page).to have_css("img[src*='http://img09.deviantart.net']")

    expect(page).to have_content(item2.title)
    expect(page).to have_content(item2.description)
    expect(page).to have_content("$3,000.00")
    expect(page).to have_css("img[src*='http://www.bulldozer-vfx.com']")

    expect(page).to have_content(cart.total)
  end
end
