require 'rails_helper'

RSpec.describe 'Platform admin can make a business active', type: :feature do
  scenario 'they can make an active business inactive' do
    user = create(:user, role: 2)
    create(:business, user: user, status: 'inactive')
    page.set_rack_session(user_id: user.id)

    visit platform_admin_businesses_path

    expect(Business.first.status).to eq "inactive"

    click_on "Activate"

    expect(Business.first.status).to eq "active"
    expect(current_path).to eq platform_admin_businesses_path

    within('.flash-success') do
      expect(page).to have_content "Business has been activated!"
    end

    within('#existing-businesses') do
      expect(page).to have_content "Acme"
      expect(page).to have_content "Status: Active"
    end
  end
end
