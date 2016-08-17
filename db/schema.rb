# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160817190526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "status",  default: 0
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "properties", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price_per_guest"
    t.string   "image_path",         default: "http://vignette4.wikia.nocookie.net/lego/images/6/63/New52Cyborg_Happy!.png/revision/latest?cb=20141224001316"
    t.datetime "created_at",                                                                                                                                   null: false
    t.datetime "updated_at",                                                                                                                                   null: false
    t.string   "image_content_type"
    t.integer  "location_id"
    t.integer  "max_occupancy"
    t.index ["location_id"], name: "index_properties_on_location_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "order_id"
    t.decimal  "price"
    t.integer  "number_of_guests"
    t.integer  "property_id"
    t.datetime "starting_date"
    t.datetime "end_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["order_id"], name: "index_reservations_on_order_id", using: :btree
    t.index ["property_id"], name: "index_reservations_on_property_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "password_digest"
    t.integer "role",            default: 0
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
  end

  add_foreign_key "orders", "users"
  add_foreign_key "properties", "locations"
  add_foreign_key "reservations", "orders"
  add_foreign_key "reservations", "properties"
end
