class AddColumnsToOrderItem < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :title, :string
    add_column :order_items, :price, :decimal
  end
end
