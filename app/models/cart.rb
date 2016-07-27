class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def total
    contents.values.sum
  end

  def find_items
    contents.keys.map do |id|
      Item.find(id)
    end
  end

  def total_price
    price = contents.map do |id, quantity|
      item = Item.find(id)
      item.price * quantity
    end.sum.to_f
  end

end
