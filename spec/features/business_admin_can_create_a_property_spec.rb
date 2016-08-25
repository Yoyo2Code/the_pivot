require 'rails_helper'


RSpec.feature "business admin can create a business" do
  scenario "using the dashboard" do
    user = create(:user, role: 1)
    business = create(:business, user: user)
    location = create(:location)
    page.set_rack_session(user_id: user.id)

    visit dashboard_path

    click_on "Create My Property"

    fill_in "Title", with: "White House"
    fill_in "Description", with: "It's a big house"
    fill_in "Price per guest", with: 19
    fill_in "Image path", with: "http://vignette4.wikia.nocookie.net/lego/images/6/63/New52Cyborg_Happy!.png/revision/latest?cb=20141224001316"
    find(:xpath, '//*[@id="location"]/option').select_option
    fill_in "Max occupancy", with: 3

    click_on "Create Property"

    expect(page).to have_content("Property Created!")

    expect(page).to have_content("White House")
    expect(page).to have_content("It's a big house")
    expect(page).to have_content("19")
    expect(page).to have_content("Location: New York")
    expect(page).to have_content("3")
  end
end
