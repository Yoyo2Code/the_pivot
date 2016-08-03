require 'rails_helper'

RSpec.feature "admin can create an item" do
  scenario "logged in admin creates an item" do

    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    # As an admin
    # When I visit the new item path
    visit new_item_path
    # And I fill in the fields
    fill_in "Title", with: "Robot Head"
    fill_in "Description", with: "Big Robot Head"
    fill_in "Price", with: 10000
    fill_in "Category", with: "Head"
    # And click 'Create Item'
    click_on "Create Item"
    save_and_open_page
    # I should see the item on the item show page
    expect(page).to have_content("Robot Head")
    expect(page).to have_content("Big Robot Head")
    expect(page).to have_content("$10,000.00")
    expect(page).to have_css("img[src*='http://vignette4.wikia.nocookie.net/lego/images/6/63/New52Cyborg_Happy!.png/revision/latest?cb=20141224001316']")
  end
end
