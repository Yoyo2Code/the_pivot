require 'rails_helper'
# As a User,
# When I visit my dashboard
# and I click 'Open a Business'
# and I fill in my business name and description
# and I click 'Submit'
# then I expect to be redirected to my dashboard,
# and I expect to see a flash message confirming /
# that my application has been submitted.

RSpec.describe 'Platform admin can view pending businesses', type: :feature do
  scenario 'they click a link on their dashboard and see pending businesses' do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit new_business_path

    fill_in 'business[name]', with: 'Yoseph & Co.'
    click_button 'Submit New Business Application'


  

    user = create(:user, username: "David", role: 2)
    business = create(:business, user: user)
    location = create(:location)
    create(:property, business: business, location: location)
    property = location.properties.first
    business_name = property.business.slug
    page.set_rack_session(user_id: user.id)
  end
end
