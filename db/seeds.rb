# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Property.destroy_all
Location.destroy_all
Business.destroy_all

loc1 = Location.create!(city: "Denver")
loc2 = Location.create!(city: "New York")

business = Business.create!(name: "Acme")

loc1.properties.create!(title: "Tiny House", description: "It's really small", price_per_guest: 10000.0, image_path: 'https://upload.wikimedia.org/wikipedia/commons/5/56/Hotel-room-renaissance-columbus-ohio.jpg', business_id: business.id, max_occupancy: 3)
loc1.properties.create!(title: "Hotel", description: "The lap of luxury", price_per_guest: 3000.0, image_path: 'https://upload.wikimedia.org/wikipedia/commons/9/9d/UMass_Hotel_room.JPG', business_id: business.id, max_occupancy: 4)

loc2.properties.create!(title: "Motel", description: "Sleep for cheap", price_per_guest: 15000.0, image_path: 'https://c2.staticflickr.com/8/7309/9638499309_43eb058de5_b.jpg', business_id: business.id, max_occupancy: 2)
loc2.properties.create!(title: "Boat", description: "Stay on the water", price_per_guest: 5000.0, image_path: 'https://upload.wikimedia.org/wikipedia/commons/d/d7/Executive_Premier_Room_-_Novotel_Century_Hong_Kong_Hotel.jpg', business_id: business.id, max_occupancy: 4)

business.properties.create!(title: "My House", description: "Come stay at my house", price_per_guest: 5000.0, image_path: 'https://upload.wikimedia.org/wikipedia/commons/8/83/Imperial_Hotel_Osaka_regular_floor_standard_twin_room_20120630-001.jpg',
 location: loc1, business_id: business.id, max_occupancy: 4)
