require 'rails_helper'

RSpec.feature "user can view past orders" do
  scenario "user can see past orders" do
    # As a authenticated user
    visit items_path
    cart = Cart.new(nil)
    first(:button, "Add to Cart").click
    visit cart_index_path
    click_on("Create Account")
    fill_in "Username", with: "Penelope"
    fill_in "Password", with: "password"
    click_on("Create Account")

    visit cart_index_path
    # When I visit "/orders"
    click_on("Checkout")

 # Then I should see all orders belonging to me and other orders

  end
end
