class AddTimestampsToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :created_at, :datetime
  end
end
