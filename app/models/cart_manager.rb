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
                                  starting_date: DateTime.strptime(property.starting_date, "%m/%d/%Y"),
                                  end_date: DateTime.strptime(property.end_date, "%m/%d/%Y")
                                 )
      end
  end
end
