require 'rails_helper'

RSpec.feature "user can see all items in category" do
  scenario "user sees categorized items" do
    visit category_path('arms')

    expect(page).to have_content("Robot Arm")
    expect(page).to have_content("Robot Hand")

    visit category_path('legs')

    expect(page).to have_content("Robot Leg")
    expect(page).to have_content("Robot Foot")
  end
end
