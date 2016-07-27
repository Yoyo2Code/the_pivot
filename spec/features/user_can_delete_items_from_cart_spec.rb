require 'rails_helper'

RSpec.feature 'user can delete items from cart' do
  scenario 'delete item from a cart with 1 item' do

    visit items_path
    first(:button, "Add to Cart").click
    expect(page).to have_content("Cart Items: 1")
    # As a visitor
    # When I visit "/cart"
    visit cart_index_path
    # And I click link "Remove"
    click_on "Remove"
    # Then my current page should be "/cart"
    expect(current_path).to eq '/cart'
    # And I should see a message styled in green
    # expect(page.cell_element).style("color").to eq("green")
    # And the message should say "Successfully removed SOME_ITEM from your cart."
    expect(page).to have_content("Successfully removed Robot Arm")
    # And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
    expect(page).to have_link("Robot Arm")
    # And I should not see the item listed in cart
    expect(page).to have_content("Cart Items: 0")



  end
end
