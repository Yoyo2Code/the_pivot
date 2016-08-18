class CartItem < SimpleDelegator
  attr_reader :property, :occupancy, :starting_date, :end_date

  def initialize(property_id, occupancy, starting_date, end_date)
    @property = Property.find(property_id)
    @occupancy = occupancy
    @starting_date = starting_date
    @end_date = end_date
    super(@property)
  end



end
