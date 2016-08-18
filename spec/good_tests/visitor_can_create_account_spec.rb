require 'rails_helper'

RSpec.describe 'Visitor can create an account', type: :feature do
  scenario 'they can visit create account page from login' do
    visit login_path

    click_link 'Create Account'

    expect(current_path).to eq(new_user_path)
  end

  scenario 'they are redirected to dashboard after creation' do
    visit new_user_path

    fill_in 'Username', with: 'Yoseph'
    fill_in 'Password', with: 'password'
    click_button 'Create Account'

    within('.flash-success') do
      expect(page).to have_content('Account successfully created!')
    end

    expect(current_path).to eq(dashboard_path)
  end
end
