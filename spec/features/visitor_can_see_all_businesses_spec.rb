require 'rails_helper'

RSpec.describe 'Visitor can see all businesses', type: :feature do
  scenario 'they can access businesses from root by clicking pill' do
    business = create(:business)

    visit root_path

    click_link 'Businesses'

    within('#businesses') do
      expect(page).to have_link(business.name)
    end
  end
end
