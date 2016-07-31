require 'rails_helper'

RSpec.feature "user can view item show page and see if item is retired" do
  scenario "user visits item show page" do
    user = User.create(username: "Caleb",
                        password: "password")

    cat1 = Category.create(title: "arms")

    cat1.items.create(title: "Robot Arm", description: "Cool ass arm", price: 10000.0, image_path: 'http://img09.deviantart.net/588b/i/2004/272/7/2/i__robot_arm_by_chainsawdeathriot.jpg', status: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    # As a user
    # if I visit an item page and that item has been retired
    visit root_path
    click_on("Robot Arm")
    # Then I should still be able to access the item page
    expect(current_path).to eq('/items/1')
    # And I should not be able to add the item to their cart
    expect(page).to_not have_content("Add to Cart")
    # And I should see in place of the "Add to Cart" button or link - "Item Retired"
    expect(page).to have_content("Item Retired")
  end
end
