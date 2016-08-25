require 'rails_helper'

RSpec.describe "Cart" do
  it "should have initial content" do
    cart = Cart.new(
      "1" => {
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
    user = create(:user)
    location = create(:location)
    business = create(:business, user: user)
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
      property.id.to_s => {
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

  # xit "should be able to find items" do
  #   user = create(:user)
  #   location = create(:location)
  #   business = create(:business, user: user)
  #   property = location.properties.create!(
  #     title: "Tiny House",
  #     description: "It's really small",
  #     price_per_guest: 10_000.0,
  #     image_path: 'https://upload.wikimedia.org/wikipedia/commons/5/56'\
  #                 '/Hotel-room-renaissance-columbus-ohio.jpg',
  #     business_id: business.id,
  #     max_occupancy: 3
  #   )
  #   cart = Cart.new(
  #     property.id.to_s => {
  #       starting_date: "08/16/2016",
  #       end_date: "08/17/2016",
  #       occupancy: 2,
  #       night_count: 2
  #     })
  #   cart_items = cart.find_items
  #
  #   expect(cart_items.first).to be_instance_of(CartItem)
  # end
  #
  # xit "should be able to compute total price" do
  #   user = create(:user)
  #   location = create(:location)
  #   business = create(:business, user: user)
  #   property = location.properties.create!(
  #     title: "Tiny House",
  #     description: "It's really small",
  #     price_per_guest: 10_000.0,
  #     image_path: 'https://upload.wikimedia.org/wikipedia/commons/5/56'\
  #                 '/Hotel-room-renaissance-columbus-ohio.jpg',
  #     business_id: business.id,
  #     max_occupancy: 3
  #   )
  #   cart = Cart.new(
  #     property.id.to_s => {
  #       starting_date: "08/16/2016",
  #       end_date: "08/17/2016",
  #       occupancy: 2,
  #       night_count: 2
  #     })
  #
  #   expect(cart.total_price).to eq(30_000.0)
  # end

  it "delete an item" do
    user = create(:user)
    location = create(:location)
    business = create(:business, user: user)
    property = location.properties.create!(
      title: "Tiny House",
      description: "It's really small",
      price_per_guest: 10_000.0,
      image_path: 'https://upload.wikimedia.org/wikipedia/commons/5/56'\
                  '/Hotel-room-renaissance-columbus-ohio.jpg',
      business_id: business.id,
      max_occupancy: 3
    )
    cart = Cart.new(
      property.id.to_s => {
        starting_date: "08/15/2016",
        end_date: "09/01/2016",
        occupancy: 2
      })

    cart.delete_item(property.id)

    expect(cart.contents[property.id.to_s]).to eq(nil)
  end
end
