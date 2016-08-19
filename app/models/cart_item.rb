class CartItem < SimpleDelegator
  attr_reader :property, :occupancy, :starting_date, :end_date

  def initialize(params)
    @property = Property.find(params[:property_id])
    @occupancy = params[:occupancy]
    @starting_date = params[:starting_date]
    @end_date = params[:end_date]
    super(@property)
  end

  def subtotal
    property.price_per_guest * occupancy
  end

end
