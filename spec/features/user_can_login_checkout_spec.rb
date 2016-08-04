require 'rails_helper'

RSpec.feature "user can login and checkout" do
  scenario "user can see checkout and items" do

    # As a visitor when I have items in my cart
    # And when I visit "/cart"
    visit cart_index_path

    # I should not see an option to "Checkout"
    expect(page).to_not have_link("Checkout")
    # I should see an option to "Login or Create Account to Checkout"
    expect(page).to have_content("Login or Create Account to Checkout")
    # After I create an account
    first(:link, "Create Account").click
    # And I fill in my desired credentials
    fill_in "Username", with: "Penelope"
    fill_in "Password", with: "password"
    fill_in "Email Address", with: "penelope@gmail.com"
    first(:button, "Create Account").click
    # And I visit "/cart
    visit cart_index_path
    # Then I should see all of the data that was there when I was not logged in
    # When I click "Logout"

    first(:link, "Logout").click
    # Then I should see see "Login"
    expect(page).to have_link("Login")
    # And I should not see "Logout"
    expect(page).to_not have_link("Logout")
  end
end
