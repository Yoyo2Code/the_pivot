require 'rails_helper'
RSpec.describe 'User can apply for business ownership', type: :feature do
  scenario 'they see the link on their dashboard' do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit dashboard_path

    expect(page).to have_link('Open a Business')
  end

  scenario 'they are redirected and see flash after submitting' do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit new_business_path

    fill_in 'business[name]', with: 'Yoseph & Co.'
    click_button 'Submit New Business Application'

    expect(current_path).to eq(dashboard_path)
    within('.flash-success') do
      expect(page).to have_content('Your business application has been submitted!'\
                                   'We will be getting back to you shortly.')
    end
  end
end
