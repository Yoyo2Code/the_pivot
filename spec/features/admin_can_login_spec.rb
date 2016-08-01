require 'rails_helper'

RSpec.feature "user can login" do
  scenario "admin can login" do


    admin = create(:user, role: 1)
    # As an Admin
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    # When I log in
    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: "password"
    click_on "Login"
    # Then I am redirected to "/admin/dashboard"
    expect(current_path).to eq('/admin/dashboard')
  end
end
