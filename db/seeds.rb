class Seed
  def seed
    Property.destroy_all
    Location.destroy_all
    Business.destroy_all
    user = create_user
    create_businesses(user)
  end

  def create_businesses(user)
    12.times do
      Business.create!(name: Faker::Company.name,
                       image_url: "https://robohash.org/#{rand(10)}",
                       user: user)
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

  def add_nights
    from = Time.now
    to = Time.new('2017/1/1')
    until from >= to
      Night.create!(date: (from += 1.day))
    end
  end

  def create_user
    User.create!(username: 'David', password: 'password', role: 1)
  end

  def seed_users
    u1 = User.create!(username: 'Yoseph', password: 'password')
    u2 = User.create!(username: 'Pat', password: 'password')
    u1.orders.create!
    u2.orders.create!
    u1.orders.first.reservations.create!(starting_date: Night.all[1].date, end_date: Night.all[5].date, number_of_guests: 2, price: 1500, property_id: Property.first.id)
    u2.orders.first.reservations.create!(starting_date: Night.all[10].date, end_date: Night.all[13].date, number_of_guests: 2, price: 1500, property_id: Property.first.id)
  end
end
seeder = Seed.new
seeder.seed
seeder.add_nights
seeder.seed_users
