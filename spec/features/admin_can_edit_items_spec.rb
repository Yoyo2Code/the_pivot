require 'rails_helper'

RSpec.feature "admin can edit an item" do
  scenario "admin edits an item" do

    admin = create(:user, role: 1)
    category = create(:category)

    item = category.items.create(attributes_for :item)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    # As an admin
    # When I visit the root path
    visit root_path
    # And I click on 'Edit'
    first(:link, "Edit").click
    # I should be on the edit item page
    expect(current_path).to eq(edit_item_path(item))
    # And when I fill in the fields and click 'Edit Item'
    fill_in "Title", with: "Robot Shoulder"
    fill_in "Description", with: "Rotary Shoulder"
    fill_in "Price", with: 10000
    fill_in "Category", with: "Arms"
    click_on "Edit Item"
    # I should be on the item show page
    expect(current_path).to eq(item_path(item))
    # And I should see the edited information
    expect(page).to have_content("Robot Shoulder")
    expect(page).to have_content("Rotary Shoulder")
    expect(page).to have_content("$10,000.00")
    expect(page).to have_css("img[src*='http://img09.deviantart.net']")
  end
end
