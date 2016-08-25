require 'rails_helper'
RSpec.describe 'User can manage account information', type: :feature do
  scenario 'they can access edit page from dashboard' do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit dashboard_path
    click_link 'Edit Account Information'

    expect(current_path).to eq(edit_user_path(user.id))
  end

  scenario 'they can edit account information' do
    user = create(:user, first_name: 'Bill')
    page.set_rack_session(user_id: user.id)

    visit edit_user_path(user)

    fill_in 'Password', with: 'newpassword'
    click_button 'Save Changes'

    expect(current_path).to eq(dashboard_path)
    within('.flash-success') do
      expect(page).to have_content('Changes to your account have been saved!')
    end
  end

  scenario 'they see their new information' do
    user = create(:user, first_name: 'Bill')
    page.set_rack_session(user_id: user.id)

    visit edit_user_path(user)

    fill_in 'Username', with: 'Megatron'
    fill_in 'Password', with: 'newpassword'
    click_button 'Save Changes'

    within('#user-dashboard') do
      expect(page).to have_content('Welcome, Megatron')
    end
  end
end
