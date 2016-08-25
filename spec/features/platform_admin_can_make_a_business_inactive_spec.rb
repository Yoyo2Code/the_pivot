require 'rails_helper'

RSpec.describe 'Platform admin can make a business inactive', type: :feature do
  scenario 'they can make an active business inactive' do
    user = create(:user, role: 2)
    create(:business, user: user, status: 'active')
    page.set_rack_session(user_id: user.id)

    visit platform_admin_businesses_path

    expect(Business.first.status).to eq "active"

    click_on "Deactivate"

    expect(Business.first.status).to eq "inactive"
    expect(current_path).to eq platform_admin_businesses_path

    within('.flash-success') do
      expect(page).to have_content "Business has been deactivated!"
    end

    within('#existing-businesses') do
      expect(page).to have_content "Acme"
      expect(page).to have_content "Status: Inactive"
    end
  end
end
