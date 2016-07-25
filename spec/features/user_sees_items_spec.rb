require 'rails_helper'

RSpec.feature "User sees items" do
  scenario "user views items when not logged in" do

    item = Item.create(title: "Robo Arm", description: "A Robot Arm",
    price: 1192.00, image_path: "http://img09.deviantart.net/588b/i/2004/272/7/2/i__robot_arm_by_chainsawdeathriot.jpg" )

    visit items_path

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price)
    expect(page).to have_css("img[src*='http://img09.deviantart.net']")
  end
end
