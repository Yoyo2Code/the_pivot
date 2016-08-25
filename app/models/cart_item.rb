class CartItem < SimpleDelegator
  attr_reader :property, :occupancy, :starting_date, :end_date

  def initialize(property_id, occupancy, starting_date, end_date)
    @property = Property.find(property_id)
    @occupancy = occupancy
    @starting_date = starting_date
    @end_date = end_date
    @night_count = night_count
    super(@property)
  end

  def subtotal
    price_per_guest * occupancy.to_i * night_count
  end

  def night_count
    d1 = Date.strptime(@starting_date, '%m/%d/%Y')
    d2 = Date.strptime(@end_date, '%m/%d/%Y')
    (d2 - d1).to_i
  end
end
