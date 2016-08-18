require 'rails_helper'

RSpec.describe 'User can logout', type: :feature do
  scenario 'they can click to logout' do
    user = create(:user)
    page.set_rack_session(:user_id => user.id)

    visit dashboard_path(user)
    click_link 'Logout'

    expect(page).to have_link('Login')
    expect(page).to have_content('Successfully logged out!')
    expect(page).not_to have_link('Logout')
    expect(page.get_rack_session[:user_id]).to be_falsey
  end
end
