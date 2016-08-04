require 'rails_helper'

RSpec.feature "user can login" do
  scenario "user can see login page" do


    # As a visitor
    # When I visit "/"
    visit root_path
    # Then I should see a link for "Login"
    expect(page).to have_content("Login")
    # And when I click "Login"
    first(:link, "Login").click
    # And I should be on the "/login" page
    expect(current_path).to eq(login_path)
    # I should see a place to insert my credentials to login
    # save_and_open_page
    expect(page.find("#session_username")).to be_truthy
    expect(page.find("#session_password")).to be_truthy
    expect(page).to have_link("Create Account")

    # And I should see a link to "Create Account"

  end

  scenario "user can login" do
    # As a visitor
    # When I visit "/login
    visit login_path
    # And when I click link "Create Account"
    first(:link, "Create Account").click
    # And I fill in my desired credentials
    fill_in "Username", with: "Penelope"
    fill_in "Password", with: "password"
    fill_in "Email Address", with: "penelope@gmail.com"
    # And I submit my information
    first(:button, "Create Account").click
    # Then my current page should be "/dashboard"
    expect(current_path).to eq("/dashboard")
    # And I should see a message in the navbar that says "Logged in as SOME_USER"
    expect(page).to have_content("Logged in as Penelope")
    # And I should see my profile information
    expect(page).to have_content("Username: Penelope")
    # And I should not see a link for "Login"
    expect(page).to_not have_content("Login")
    # And I should see a link for "Logout"
    expect(page).to have_content("Logout")
  end
end
