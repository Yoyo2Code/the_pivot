class CreateBookedDates < ActiveRecord::Migration[5.0]
  def change
    create_table :booked_dates do |t|
      t.references :date, foreign_key: true
      t.references :property, foreign_key: true
    end
  end
end
