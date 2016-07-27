require 'rails_helper'

RSpec.feature "user can login" do
  scenario "user can login" do

    # As a visitor
    # When I visit "/"
    visit root_path
    # Then I should see a link for "Login"
    expect(page).to have_content("Login")
    # And when I click "Login"
    click_on "Login"
    # And I should be on the "/login" page
    expect(current_path).to eq(login_path)
    # I should see a place to insert my credentials to login
    save_and_open_page
      # find_field("Username").should have_content("Username")
      #expect(page).should have_content("Password")
      expect(page).to have_button("Create Account")

    # And I should see a link to "Create Account"

  end
end
