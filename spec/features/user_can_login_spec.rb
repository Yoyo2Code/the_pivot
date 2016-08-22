require 'rails_helper'

RSpec.feature "Visitor can login" do
  scenario "they see a logout link after logging in" do
    user = create(:user)

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password

    within('.login-form') do
      click_on "Login"
    end

    expect(page).to have_link("Logout")
    expect(page).not_to have_link("Login")
  end
end
