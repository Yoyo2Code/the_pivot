FactoryGirl.define do
  factory :property do
    title "Trump Tower"
    description "Small rooms"
    price_per_guest 10000.0
    image_path 'http://img09.deviantart.net'
    max_occupancy 4
    location
    business
  end
end
