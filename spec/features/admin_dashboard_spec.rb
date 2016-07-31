require 'rails_helper'

RSpec.feature "admin dashboard is different than a regular users" do
  scenario "dashboard shows admin dashboard" do

    admin = create(:user, role: 1)

    # As an Admin
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    # When I visit "/admin/dashboard"
    visit admin_dashboard_path
    # I will see a heading on the page that says "Admin Dashboard"
    expect(page).to have_content("Admin Dashboard")
  end

  scenario "admin dashboard is only accessible to admin" do
    # As a registered user
    user = User.create(username: "Penelope",
                       password: "pass")
    visit login_path
    fill_in "Username", with: "Penelope"
    fill_in "Password", with: "pass"
    # When I visit "/admin/dashboard"
    visit admin_dashboard_path
    # I get a 404
    expect(page).to have_content("The page you were looking for doesn't exist")
    # As an unregistered user
    visit logout_path
    # When I visit "/admin/dashboard"
    visit admin_dashboard_path
    # I get a 404
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
