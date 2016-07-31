require 'rails_helper'

RSpec.feature "user can view item show page and see if item is retired" do
  scenario "user visits item show page and sees retired item" do
    user = create(:user)


    category = create(:category) do |category|
      category.items.create(attributes_for(:item, status: 1))
    end

    item = category.items.first



    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    # As a user
    # if I visit an item page and that item has been retired
    visit root_path
    click_on("Robot Arm")
    # Then I should still be able to access the item page
    expect(current_path).to eq(item_path(item))
    # And I should not be able to add the item to their cart
    expect(page).to_not have_content("Add to Cart")
    # And I should see in place of the "Add to Cart" button or link - "Item Retired"
    expect(page).to have_content("Item Retired")
  end
end
