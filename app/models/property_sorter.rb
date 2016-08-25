class PropertySorter
  attr_reader :properties, :start_date, :end_date
  def initialize(properties)
    @properties = properties
  end

  def booked_properties(start_date, end_date)
    @start_date = Time.new(start_date[:year],
                           start_date[:month],
                           start_date[:day])

    @end_date = Time.new(end_date[:year],
                         end_date[:month],
                         end_date[:day])
    parse_properties
  end

  def parse_properties
    properties.find_all do |property|
      bm = BookingManager.new(property)
      bm.occupied?(start_date, end_date)
    end
  end
end
