class BookingManager
  attr_reader :property, :start_date, :end_date
  def initialize(property)
    @property = property
  end

  def create_bookings(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
    property.nights << booked_nights(Night)
  end

  def grouped_bookings
  end

  def booked_nights(nights)
    nights.where(
      date: start_date...end_date
    )
  end

  def occupied?(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
    !booked_nights(property.nights).empty?
  end
end
