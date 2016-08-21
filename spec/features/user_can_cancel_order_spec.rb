# require 'rails_helper'
#
# RSpec.feature "UserCancelTest" do
#   scenario "user can cancel order" do
#     cat1 = Category.create!(title: "arms")
#     cat1.items.create!(title: "Robot Arm", description: "Cool ass arm",
#     price: 10000.0, image_path: 'http://img09.deviantart.net/588b/i/2004/272/7/2/i__robot_arm_by_chainsawdeathriot.jpg')
#
#
#     visit items_path
#     cart = Cart.new(nil)
#     first(:button, "Add to Cart").click
#     first(:button, "Add to Cart").click
#     first(:button, "Add to Cart").click
#     visit cart_path
#     first(:link, "Create Account").click
#     fill_in "First Name", with: "Penelope"
#     fill_in "Last Name", with: "Jones"
#     fill_in "Username", with: "Penelope"
#     fill_in "Password", with: "password"
#     fill_in "Email Address", with: "penelope@gmail.com"
#     first(:button, "Create Account").click
#     visit cart_path
#
#     # When I visit "/orders"
#     page.execute_script("$('.stripe-button').show()")
#     first(:button, "Pay with Card").click
#     expect(page).to have_content("Order #")
#
#     click_on "1"
#     expect(page).to have_content("Cancel Order")
#
#     first(:button, "Cancel Order").click
#
#     expect(page).to have_content("Order Status")
#     expect(page).to have_content("Canceled")
#
#   end
# end
