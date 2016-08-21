class RenameDate < ActiveRecord::Migration[5.0]
  def change
    rename_table :dates, :nights
  end
end
