# require 'rails_helper'
#
# RSpec.feature "user can view past orders" do
#
#   scenario "user can see past orders" do
#     category = create(:category) do |category|
#       category.items.create(attributes_for(:item))
#     end
#
#
#     visit items_path
#     cart = Cart.new(nil)
#     click_on("Add to Cart")
#     visit cart_index_path
#     first(:link, "Create Account").click
#     fill_in "First Name", with: "Penelope"
#     fill_in "Last Name", with: "Jones"
#     fill_in "Username", with: "Penelope"
#     fill_in "Password", with: "password"
#     fill_in "Email Address", with: "penelope@gmail.com"
#     first(:button, "Create Account").click
#     visit cart_index_path
#
#     # When I visit "/orders"
#     first(:button, "Checkout").click
#     expect(page).to have_content("Order #")
#     #  And I should see a link to view that order
#     click_on "1"
#     expect(page).to have_content("Quantity")
#     expect(page).to have_content("Price")
#     expect(page).to have_content("Name")
#   #   And I should see links to each item's show page
#     expect(page).to have_content("Robot Arm")
#   # And I should see the current status of the order (ordered, paid, cancelled, completed)
#   # And I should see the total price for the order
#     expect(page).to have_content("Order Total")
#   # And I should see the date/time that the order was submitted
#     expect(page).to have_content("Time Order Was Submitted")
#   # If the order was completed or cancelled
#     expect(page).to have_content("Order Status")
#     expect(page).to have_content("Completed")
#   # Then I should see a timestamp when the action took place
#     expect(page).to have_content("Time Completed or Canceled")
#
#
# end
#
#   scenario "user can click a link and see order quantity and subtotal" do
#
#   end
#
# end
