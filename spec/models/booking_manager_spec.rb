require 'rails_helper'

RSpec.describe BookingManager, type: :model do
  it 'creates property nights given start and end dates' do
    create_nights
    start_night = Night.first
    end_night = Night.last
    property = create(:property)
    bm = BookingManager.new(property)

    expect{
      bm.create_bookings(start_night.date, end_night.date)
    }.to change{ property.nights.count }.from(0).to(4)
  end

  def create_nights
    5.times do |i|
      Night.create(date: Time.new(2016, 9, (i + 1)))
    end
  end
end
