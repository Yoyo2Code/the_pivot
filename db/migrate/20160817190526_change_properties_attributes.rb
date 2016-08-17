class ChangePropertiesAttributes < ActiveRecord::Migration[5.0]
  def change
    remove_column :properties, :status

    rename_column :properties, :price, :price_per_guest

    add_column :properties, :max_occupancy, :integer
  end
end
