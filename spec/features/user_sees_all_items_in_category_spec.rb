require 'rails_helper'

RSpec.feature "user can see all items in location" do
  scenario "user sees categorized items" do
    location1 = create(:location) do |location|
      location.items.create(attributes_for(:item))
    end
    location1.items.create(attributes_for(:item, title: "Robot Hand", description: "Cool ass hand", price: 3000.0, image_path: 'http://www.bulldozer-vfx.com/wp-content/uploads/2013/07/yyyyyyyyuu.jpg'))

    location2 = create(:location, title: "legs") do |location|
      location.items.create(attributes_for(:item, title: "Robot Leg", description: "Cool ass leg", price: 15000.0, image_path: 'http://marshallhuffman.files.wordpress.com/2010/04/front-leg-final-01.jpg'))
    end

    location2.items.create(attributes_for(:item, title: "Robot Foot", description: "Cool ass foot", price: 5000.0, image_path: 'http://img09.deviantart.net/beb5/i/2014/144/2/4/foot_prosthetic__concept_by_drzoidberg96-d7jlpoo.jpg'))

    visit '/arms'
    
    expect(page).to have_content("Robot Arm")
    expect(page).to have_content("Robot Hand")

    visit '/legs'

    expect(page).to have_content("Robot Leg")
    expect(page).to have_content("Robot Foot")
  end
end
