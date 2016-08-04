require 'rails_helper'

RSpec.feature "admin can modify account" do
  scenario "admin can modify account" do

    admin = create(:user, role: 1)
    user = create(:user, username: "Penelope")
    # As an Admin
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    #I can modify my account data
    visit admin_dashboard_path
    click_on "Edit Account"
    fill_in "Username", with: "Bob"
    fill_in "Password", with: admin.password
    click_on "Submit"
    expect(current_path).to eq(admin_dashboard_path)
    #But I cannot modify any other user's account data
    visit user_path(user)
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
