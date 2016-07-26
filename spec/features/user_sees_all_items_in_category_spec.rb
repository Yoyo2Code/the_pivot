require 'rails_helper'

RSpec.feature "user can see all items in category" do
  scenario "user sees categorized items" do
    # require "pry"; binding.pry
    visit category_path(1)

    expect(page).to have_content("Robot Arm")
    expect(page).to have_content("Robot Hand")

    visit category_path(2)

    expect(page).to have_content("Robot Leg")
    expect(page).to have_content("Robot Foot")
  end
end
