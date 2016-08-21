class Seed
  def seed
    Property.destroy_all
    Location.destroy_all
    Business.destroy_all
    create_businesses
  end

  def create_businesses
    12.times do 
      Business.create!(name: Faker::Company.name, image_url: "https://robohash.org/#{rand(10)}")
    end
    create_locations
  end

  def create_locations
    Location.create!(city: "Denver")
    Location.create!(city: "New York")
    Location.create!(city: 'Toronto')
    Location.create!(city: 'Los Angeles')
    Location.create!(city: 'Chicago')
    Location.create!(city: 'Dallas')
    add_properties_to_businesses
  end

  def add_properties_to_businesses
    Business.all.each do |business|
      add_properties(business)
    end
  end

  def add_properties(business)
    6.times do |t|
      business.properties.create!(
        title: Faker::Book.title + "##{rand(1000)}",
        description: Faker::Lorem.paragraph(4),
        price_per_guest: Faker::Commerce.price,
        max_occupancy: rand(10),
        image_path: 'http://i.dailymail.co.uk/i/pix/2015/07/09/14/2A6072FF00000578-3154851-image-a-1_1436449347511.jpg',
        location: Location.all[t]
      )
    end
  end

  def seed_users
    User.create!(username: 'Yoseph', password: 'password')
    User.first.orders.create!
    User.first.orders.first.reservations.create!(starting_date: DateTime.new(2016, 8, 22), end_date: DateTime.new(2016, 8, 30), number_of_guests: 2, price: 1500, property_id: Property.first.id)
  end
end
seeder = Seed.new
seeder.seed
seeder.seed_users
