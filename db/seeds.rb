class Seed
  def seed
    Reservation.destroy_all
    Order.destroy_all
    Property.destroy_all
    Location.destroy_all
    Business.destroy_all
    User.destroy_all
    create_businesses
  end

  def create_businesses
    12.times do
      Business.create!(name: Faker::Company.name,
                       image_url: "https://robohash.org/#{rand(10)}",
                       user: create_user)
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
    Location.create!(city: 'Boston')
    Location.create!(city: 'London')
    Location.create!(city: 'Dubai')
    Location.create!(city: 'Philly')
    Location.create!(city: 'Houston')
    Location.create!(city: 'Sydney')
    add_properties_to_businesses
  end

  def add_properties_to_businesses
    Business.all.each do |business|
      add_properties(business)
    end
  end

  def add_properties(business)
    12.times do |t|
      business.properties.create!(
        title: Faker::Book.title + "##{rand(1000)}",
        description: Faker::Lorem.paragraph(4),
        price_per_guest: Faker::Commerce.price,
        max_occupancy: rand(1..10),
        image_path: 'http://i.dailymail.co.uk/i/pix/2015/07/09/14/2A6072FF00000578-3154851-image-a-1_1436449347511.jpg',
        location: Location.all[t]
      )
    end
  end

  def add_nights
    from = Time.new(2016, 8, 27)
    to = Time.new(2017, 4, 1)
    until from >= to
      Night.create!(date: (from += 1.day))
    end
  end

  def create_user
    User.create!(username: Faker::Name.first_name,
                 password: 'password',
                 role: rand(3))
  end

  def seed_users
    u1 = User.create!(username: 'Yoseph', password: 'password')
    u2 = User.create!(username: 'Pat', password: 'password')
    u3 = User.create!(username: 'David', password: 'password')
    u4 = User.create!(username: 'Jason', password: 'password')
  end

  def seed_bookings
    seed_orders
    count = 1
    Property.all.shuffle.each do |prop|
      5.times do 
        book_property(prop, count)
        count += rand(10..20)
      end
      count = 1
    end
  end

  def seed_orders
    User.all.each do |u|
      u.orders.create!
    end
  end

  def book_property(prop, count)
    duration = rand(2..4)
    night_id = Random.new.rand(count..(count + rand(10..20)))
    duration.times do |i|
      prop.nights << Night.find(night_id + i)
    end
  end

  def seed_bookings
    seed_orders
    count = 1
    Property.all.shuffle.each do |prop|
      5.times do
        book_property(prop, count)
        count += rand(10..20)
      end
      count = 1
    end
  end

  def seed_orders
    User.all.each do |u|
      u.orders.create!
    end
  end

  def book_property(prop, count)
    duration = rand(2..4)
    night_id = Random.new.rand(count..(count + rand(10..20)))
    duration.times do |i|
      prop.nights << Night.find(night_id + i)
    end
  end
end
seeder = Seed.new
seeder.seed
seeder.add_nights
seeder.seed_users
seeder.seed_bookings
