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
    19.times do
      Business.create!(name: Faker::Company.name,
                       image_url: "https://robohash.org/#{rand(10)}",
                       user: create_user)
    end
    Business.create!(name: Faker::Company.name,
                     image_url: "https://robohash.org/#{rand(10)}",
                     user: User.create!(username: 'nate@turing.io',
                                        password: 'password',
                                        role: 1)
                     )
    create_locations
  end

  def create_user
    User.create!(username: Faker::Name.first_name,
                 password: 'password',
                 role: 1)
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
    add_properties_to_locations
  end

  def add_properties_to_locations
    b = Business.all.to_a
    Location.all.each do |location|
      50.times do |i|
        location.properties.create!(
          title: Faker::Book.title + " ##{i}#{rand(10000)}",
          description: Faker::Lorem.paragraph(4),
          price_per_guest: Faker::Commerce.price,
          max_occupancy: rand(1..10),
          image_path: 'http://i.dailymail.co.uk/i/pix/2015/07/09/14/2A6072FF00000578-3154851-image-a-1_1436449347511.jpg',
          business: b.rotate!.first
        )
      end
    end
  end

  def add_nights
    from = Time.new(2016, 8, 27)
    to = Time.new(2017, 4, 1)
    until from >= to
      Night.create!(date: (from += 1.day))
    end
  end

  def seed_users
    User.create!(username: 'jorge@turing.io', password: 'password', role: 2)
    99.times do |i|
      user = User.create!(username: Faker::Internet.user_name + " ##{i}#{rand(10000)}",
                   password: 'password')
      user_orders(user)
    end
    user_orders(User.create!(username: 'jmejia@turing.io', password: 'password'))
  end

  def user_orders(user)
    10.times do 
      user.orders << Order.create!
    end
  end

  def seed_bookings
    count = 1
    Property.all.shuffle.each do |prop|
      5.times do 
        book_property(prop, count)
        count += rand(10..20)
      end
      count = 1
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
