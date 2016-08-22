class RenameColumnOnBookedDates < ActiveRecord::Migration[5.0]
  def change
    rename_column :booked_dates, :date_id, :night_id
  end
end
