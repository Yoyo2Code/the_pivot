require 'rails_helper'

RSpec.describe "Cart" do
  it "should have initial content" do
    cart = Cart.new(
      "1" =>  { 
        starting_date: "08/15/2016", 
        end_date: "09/01/2016", 
        occupancy: 2 
      })

    expect(cart.contents).to eq(
      "1" => {
        starting_date: "08/15/2016",
        end_date: "09/01/2016",
        occupancy: 2
      })
  end

  it "should have an empty hash as initial contents if no session back" do
    cart = Cart.new(nil)

    expect(cart.contents).to eq({})
  end

  it "should be able to add an item" do
    location = Location.create!(city: "Denver")
    business = Business.create!(name: "Acme")
    property = location.properties.create!(
      title: "Tiny House",
      description: "It's really small",
      price_per_guest: 10_000.0,
      image_path: 'https://upload.wikimedia.org/wikipedia/commons/5/56'\
                  '/Hotel-room-renaissance-columbus-ohio.jpg',
      business_id: business.id,
      max_occupancy: 3
    )
    params = {
      property_id: property.id,
      occupancy: 2,
      starting_date: "08/15/2016",
      end_date: "09/01/2016"
    }

    cart = Cart.new(nil)

    cart.add_item(params)

    expect(cart.contents).to eq(
      property.id => {
        starting_date: "08/15/2016",
        end_date: "09/01/2016",
        occupancy: 2
      })
  end

  it "should return total number of items in cart" do
    cart = Cart.new(
      "1" => {
        starting_date: "08/15/2016",
        end_date: "09/01/2016",
        occupancy: 2
    })
    cart.add_item(
      "2" => {
        starting_date: "08/16/2016",
        end_date: "09/10/2016",
        occupancy: 4
      })

    expect(cart.total).to eq(2)
  end

  xit "should give count of specific item" do
    cart = Cart.new("1" => 2)

    expect(cart.count_of(1)).to eq(2)
  end

  xit "should be able to find items" do
    cat1 = Location.create!(title: "arms")
    item = cat1.items.create!(title: "Robot Arm", description: "Cool ass arm",
                              price: 10_000.0,
                              image_path: 'http://img09.deviantart.net/588b/i'\
                              '/2004/272/7/2/i__robot_arm_by_chainsawdeathriot.jpg')

    cart = Cart.new(item.id => 3)

    expect(cart.find_items.first).to eq(Item.first)
  end

  xit "should be able to compute total price" do
    cat1 = Location.create!(title: "arms")
    item = cat1.items.create!(title: "Robot Arm", description: "Cool ass arm",
                              price: 10000.0,
                              image_path: 'http://img09.deviantart.net/588b/i/'\
                              '2004/272/7/2/i__robot_arm_by_chainsawdeathriot.jpg')

    cart = Cart.new(item.id => 3)

    expect(cart.total_price).to eq(30_000.0)
  end

  xit "delete an item" do
    cat1 = Location.create!(title: "arms")
    item = cat1.items.create!(title: "Robot Arm", description: "Cool ass arm",
                              price: 10_000.0,
                              image_path: 'http://img09.deviantart.net/588b/i'\
                              '/2004/272/7/2/i__robot_arm_by_chainsawdeathriot.jpg')

    cart = Cart.new(item.id => 3)

    cart.delete_item(item.id)

    expect(cart.contents[item.id.to_s]).to eq(2)
  end
end
