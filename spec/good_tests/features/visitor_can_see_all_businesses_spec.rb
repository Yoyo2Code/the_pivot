require 'rails_helper'

# As a visitor
# and I visit '/'
# and I click the 'Businesses' tab
# I expect to see all of the businesses
# and I expect to see a logo for each business
# and if I click the business name
# I expect to be taken to that business's page.
RSpec.describe 'Visitor can see all businesses', type: :feature do
  scenario 'they visit the root path and see businesses tab' do
    visit root_path

    expect(page).to have_selector('div', text: 'Businesses', visible: true )
  end

  scenario 'they click businesses and see only businesses' do
    business = create(:business)

    visit root_path
    click_link 'Businesses'

    within('#businesses') do
      expect(page).to have_link(business.name)
      expect(page).to have_css('img')
    end
  end

  scenario 'they are taken to show page after clicking link' do
    business = create(:business)
    create(:property, business: business)

    visit root_path
    click_link 'Businesses'
    click_link business.name

    expect(current_path).to eq("/#{business.slug}")
  end
end
