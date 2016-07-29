require 'rails_helper'

RSpec.feature 'user can delete items from cart' do
  scenario 'delete item from a cart with 1 item' do

    visit items_path
    first(:button, "Add to Cart").click
    expect(page).to have_content("Cart Items: 1")

    visit cart_index_path

    first(:button, "Remove").click

    expect(current_path).to eq '/cart'

    expect(page).to have_content("Successfully removed Robot Arm")
    expect(page).to have_link("Robot Arm")
    expect(page).to have_content("Cart Items: 0")
  end

    scenario 'user can delete multiple items from cart'do

    visit items_path
    first(:button, "Add to Cart").click
    first(:button, "Add to Cart").click
    first(:button, "Add to Cart").click

    expect(page).to have_content("Cart Items: 3")
  end


end
