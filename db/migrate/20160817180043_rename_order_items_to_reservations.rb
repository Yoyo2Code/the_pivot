class RenameOrderItemsToReservations < ActiveRecord::Migration[5.0]
  def change
    rename_table :order_items, :reservations
  end
end
