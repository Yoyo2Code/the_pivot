require 'rails_helper'

RSpec.describe "Cart" do
  it "should have initial content" do
    cart = Cart.new({"1" => 2})

    expect(cart.contents).to eq({"1" => 2})
  end

  it "should have an empty hash as initial contents if no session back" do
    cart = Cart.new(nil)

    expect(cart.contents).to eq({})
  end

  it "should be able to add a item" do
    cart = Cart.new({"1" => 3})
    cart.add_item(1)
    cart.add_item(2)

    expect(cart.contents).to eq({"1" => 4, "2" => 1})
  end

  it "should give count of specific item" do
    cart = Cart.new({"1" => 2})

    expect(cart.count_of(1)).to eq(2)
  end

  it "should return total number of items in cart" do
    cart = Cart.new({"1" => 3})
    cart.add_item(1)
    cart.add_item(2)

    expect(cart.total).to eq(5)
  end

  it "should be able to find items" do
    cat1 = Location.create!(title: "arms")
    item = cat1.items.create!(title: "Robot Arm", description: "Cool ass arm", price: 10000.0, image_path: 'http://img09.deviantart.net/588b/i/2004/272/7/2/i__robot_arm_by_chainsawdeathriot.jpg')


    cart = Cart.new({ item.id => 3})

    expect(cart.find_items.first).to eq(Item.first)
  end

  it "should be able to compute total price" do
    cat1 = Location.create!(title: "arms")
    item = cat1.items.create!(title: "Robot Arm", description: "Cool ass arm", price: 10000.0, image_path: 'http://img09.deviantart.net/588b/i/2004/272/7/2/i__robot_arm_by_chainsawdeathriot.jpg')


    cart = Cart.new({ item.id => 3})

    expect(cart.total_price).to eq(30000.0)
  end

  it "delete an item" do
    cat1 = Location.create!(title: "arms")
    item = cat1.items.create!(title: "Robot Arm", description: "Cool ass arm", price: 10000.0, image_path: 'http://img09.deviantart.net/588b/i/2004/272/7/2/i__robot_arm_by_chainsawdeathriot.jpg')


    cart = Cart.new({ "#{item.id}" => 3})

    cart.delete_item(item.id)

    expect(cart.contents[item.id.to_s]).to eq(2)


  end

end
