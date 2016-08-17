class AddColumnsToReservations < ActiveRecord::Migration[5.0]
  def change
    add_reference :reservations, :property, index: true
    add_foreign_key :reservations, :properties
    add_column :reservations, :start_date, :datetime
    add_column :reservations, :end_date, :datetime
    add_column :reservations, :number_of_guests, :integer
    add_column :reservations, :total_price, :decimal
  end
end
