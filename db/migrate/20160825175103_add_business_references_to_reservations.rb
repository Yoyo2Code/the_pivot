class AddBusinessReferencesToReservations < ActiveRecord::Migration[5.0]
  def change
    add_reference :reservations, :business, foreign_key: true
  end
end
