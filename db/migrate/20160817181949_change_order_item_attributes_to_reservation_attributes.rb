class ChangeOrderItemAttributesToReservationAttributes < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :title
    remove_column :reservations, :item_id
    remove_column :reservations, :created_at

    add_reference :reservations, :property, index: true
    add_foreign_key :reservations, :properties

    rename_column :reservations, :quantity, :number_of_guests

    add_column :reservations, :starting_date, :datetime
    add_column :reservations, :end_date, :datetime
    add_timestamps :reservations
  end
end
