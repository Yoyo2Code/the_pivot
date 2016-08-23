require 'rails_helper'

RSpec.feature "business admin can update their own business info" do
  scenario "they can edit and change business name" do

    user = create(:user, role: 1)
    business = create(:business, user: user)
    page.set_rack_session(user_id: user.id)

    visit dashboard_path

    click_on "Edit My Business"

    fill_in "Name", with: "Turing"
    fill_in "Image", with: "http://people.turing.io/assets/students/dj_greenfield-572acd74ca15fcc9eff531f092d5e234.jpg"

    click_on "Save Changes"

    expect(current_path).to eq(properties_path(business_name: business.slug))
  end
end
