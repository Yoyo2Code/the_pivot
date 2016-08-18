class RenameCategoriesToLocations < ActiveRecord::Migration[5.0]
  def change
    rename_table :categories, :locations
  end
end
