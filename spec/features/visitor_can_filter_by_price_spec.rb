require 'rails_helper'
describe 'Visitor can filter by price', type: :feature do
  scenario 'they see items that are in the price range' do
    property_price = 30000
    business = Business.create(name: Faker::Company.name)
    location = Location.create(city: Faker::Pokemon.location)
    property = Property.create(title: Faker::Lorem.words, description: Faker::Lorem.words,
                               price_per_guest: 10000, image_path: Faker::Avatar.image,
                               max_occupancy: 3, business_id: business.id, location_id: location.id)

    visit "/#{property.business.slug}"

  end
end
