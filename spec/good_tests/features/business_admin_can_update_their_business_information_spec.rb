require 'rails_helper'

RSpec.feature "Business admin can update their own business info" do
  scenario "they can click edit my business and edit their business" do

    user = create(:user, role: 1)
    business = create(:business, user: user)
    page.set_rack_session(user_id: user.id)

    visit dashboard_path

    click_on "Edit My Business"

    expect(page).to have_content "Edit Acme"

    fill_in "Name", with: "Turing"
    fill_in "Image", with: "http://people.turing.io/assets/students/dj_greenfield-572acd74ca15fcc9eff531f092d5e234.jpg"

    click_on "Save Changes"

    within('.flash-success') do
      expect(page).to have_content "Business Successfully Updated!"
    end
    expect(current_path).to eq dashboard_path
  end

  scenario "they can click cancel on the edit form and return to dashboard" do
    user = create(:user, role: 1)
    business = create(:business, user: user)
    page.set_rack_session(user_id: user.id)

    visit dashboard_path

    click_on "Edit My Business"
    click_on "Cancel"

    expect(current_path).to eq dashboard_path
  end
end
