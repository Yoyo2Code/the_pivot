require 'rails_helper'

RSpec.feature "business admin can delete property" do
  scenario "on dashboard" do

  user = create(:user, role: 1)
  business = create(:business, user: user)
  location = create(:location)
  property = create(:property, location: location, business: business)
  page.set_rack_session(user_id: user.id)

  visit properties_path(business.slug, property)

  click_on "Delete Property"

  expect(current_path).to eq "/#{business.slug}"
  expect(page).to have_content("Property Successfully Deleted!")
  end
end
