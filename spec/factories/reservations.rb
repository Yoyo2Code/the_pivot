FactoryGirl.define do
  factory :reservation do
    price 10.00
    number_of_guests 2
    starting_date Time.now
    end_date Time.now.tomorrow
    property
  end
end
