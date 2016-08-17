class RenamePriceToPricePerGuest < ActiveRecord::Migration[5.0]
  def change
    rename_column :properties, :price, :price_per_guest
  end
end
