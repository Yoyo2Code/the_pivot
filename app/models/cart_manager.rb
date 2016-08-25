class CartManager
  def initialize(data)
    @cart = data[:cart]
    @user = data[:user]
  end

  def process_order
    order = @user.orders.create
    @cart.find_items.each do |property|
      order.reservations.create(
      property_id: property.id,
      price: property.subtotal,
      number_of_guests: property.occupancy,
      starting_date: format_date(property.starting_date),
      end_date: format_date(property.end_date),
      business_id: property.business
      )
    end
    order
  end

  def format_date(date)
    DateTime.strptime(date, "%m/%d/%Y")
  end
end
