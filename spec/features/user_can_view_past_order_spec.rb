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
    expect(page).to have_content("Order #")
    #  And I should see a link to view that order
    # click_on "#{Order.first.id}"



    # Then I should see all orders belonging to me and other orders
  end

  scenario "user can click a link and see order quantity and subtotal" do

    #     Background: An existing user that has one previous order
    # As an authenticated user
    # When I visit "/orders"
    # Then I should see my past order
    #
    # And when I click that link
    # Then I should see each item that was order with the quantity and line-item subtotals
    # And I should see links to each item's show page
    # And I should see the current status of the order (ordered, paid, cancelled, completed)
    # And I should see the total price for the order
    # And I should see the date/time that the order was submitted
    # If the order was completed or cancelled
    # Then I should see a timestamp when the action took place
  end

end
