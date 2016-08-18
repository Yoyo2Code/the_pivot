class AddSlugToBusinesses < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :slug, :string
  end
end
