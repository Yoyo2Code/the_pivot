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
end
