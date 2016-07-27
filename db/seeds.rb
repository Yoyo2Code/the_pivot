# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all

cat1 = Category.create!(title: "arms")
cat2 = Category.create!(title: "legs")

cat1.items.create!(title: "Robot Arm", description: "Cool ass arm", price: 10000.0, image_path: 'http://img09.deviantart.net/588b/i/2004/272/7/2/i__robot_arm_by_chainsawdeathriot.jpg')
cat1.items.create!(title: "Robot Hand", description: "Cool ass hand", price: 3000.0, image_path: 'http://www.bulldozer-vfx.com/wp-content/uploads/2013/07/yyyyyyyyuu.jpg')

cat2.items.create!(title: "Robot Leg", description: "Cool ass leg", price: 15000.0, image_path: 'http://marshallhuffman.files.wordpress.com/2010/04/front-leg-final-01.jpg')
cat2.items.create!(title: "Robot Foot", description: "Cool ass foot", price: 5000.0, image_path: 'http://img09.deviantart.net/beb5/i/2014/144/2/4/foot_prosthetic__concept_by_drzoidberg96-d7jlpoo.jpg')
