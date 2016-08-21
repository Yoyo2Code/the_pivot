class Cart
  attr_reader :contents
  attr_accessor :update

  def initialize(contents)
    @contents = contents || {}
  end

  def add_item(params)
    contents[params[:property_id].to_s] = { starting_date: params[:starting_date],
      end_date: params[:end_date],
      occupancy: params[:occupancy] }
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def total
    contents.keys.count
  end

  def find_items
    contents.map do |id, data|
      CartItem.new(id, data["occupancy"], data["starting_date"], data["end_date"])
    end
  end

  def total_price
    find_items.map do |cart_item|
      cart_item.subtotal
    end.sum
  end

  def delete_item(item_id)
    contents.delete_if { |id, quantity| id == item_id.to_s }
  end

  def increment_quantity_by
    content[item_id.to_s] += update
  end
end
