require "rails_helper"

RSpec.describe "CartItem" do
  it "initializes with item and quanity" do
    cat1 = Category.create!(title: "arms")
    cat1.items.create!(title: "Robot Arm", description: "Cool ass arm", price: 10000.0, image_path: 'http://img09.deviantart.net/588b/i/2004/272/7/2/i__robot_arm_by_chainsawdeathriot.jpg')
    cart = CartItem.new(Item.first.id, 1)

  
    expect(cart).to eq(Item.first)
  end
end
