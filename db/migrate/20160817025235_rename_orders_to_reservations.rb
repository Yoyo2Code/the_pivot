class RenameOrdersToReservations < ActiveRecord::Migration[5.0]
  def change
    rename_table :orders, :reservations
  end
end
