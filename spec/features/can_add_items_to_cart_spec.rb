require 'rails_helper'

RSpec.feature "User sees items" do
  scenario "a visitor can add an item to their cart" do
    # As a visitor
    # When I visit any page with an item on it
    cart = Cart.new(nil)
    visit items_path
    expect(page).to have_content("Cart Items: 0")
    # I should see a link or button for "Add to Cart"
    # When I click "Add to cart" for that item
    first(:button, "Add to Cart").click
    expect(page).to have_content("Cart Items: 1")
    # And I click a link or button to view cart
    click_link("Cart Items")
    # And my current path should be "/cart"
    expect(current_path).to eq('/cart')
    # And I should see a small image, title, description and price for the item I just added
    item = Item.find(1)
    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price)
    expect(page).to have_css("img[src*='http://img09.deviantart.net']")
    # And there should be a "total" price for the cart that should be the sum of all items in the cart
    expect(page).to have_content(cart.total)

  end
end
