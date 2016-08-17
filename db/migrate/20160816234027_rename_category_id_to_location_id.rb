class RenameCategoryIdToLocationId < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :category_id
    add_reference :items, :location, index: true
    add_foreign_key :items, :locations
  end
end
