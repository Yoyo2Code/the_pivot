class AddSlugToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :slug, :string
  end
end
