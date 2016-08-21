require "rails_helper"

RSpec.describe "CartItem" do
  it "initializes with property, start date, end date, and occupancy" do
    location = Location.create!(city: "Denver")
    business = Business.create!(name: "Acme")
    property = location.properties.create!(
      title: "Tiny House",
      description: "It's really small",
      price_per_guest: 10000.0,
      image_path: 'https://upload.wikimedia.org/wikipedia/commons/5/56/Hotel-room-renaissance-columbus-ohio.jpg',
      business_id: business.id,
      max_occupancy: 3)
    params = {property_id: property.id,
              occupancy: 2,
              starting_date: "08/15/2016",
              end_date: "09/01/2016"}
    cart_item = CartItem.new( params[:property_id],
                              params[:occupancy],
                              params[:starting_date],
                              params[:end_date] )

    expect(cart_item.property).to eq(property)
    expect(cart_item.occupancy).to eq(2)
    expect(cart_item.starting_date).to eq("08/15/2016")
    expect(cart_item.end_date).to eq("09/01/2016")
  end

  it "can calculate subtotal" do
    location = Location.create!(city: "Denver")
    business = Business.create!(name: "Acme")
    property = location.properties.create!(
      title: "Tiny House",
      description: "It's really small",
      price_per_guest: 10000.0,
      image_path: 'https://upload.wikimedia.org/wikipedia/commons/5/56/Hotel-room-renaissance-columbus-ohio.jpg',
      business_id: business.id,
      max_occupancy: 3)
    params = {property_id: property.id,
              occupancy: 2,
              starting_date: "08/15/2016",
              end_date: "09/01/2016"}
    cart_item = CartItem.new( params[:property_id],
                             params[:occupancy],
                             params[:starting_date],
                             params[:end_date] )
    subtotal = cart_item.subtotal

    expect(subtotal).to eq(20000.0)
  end
end
