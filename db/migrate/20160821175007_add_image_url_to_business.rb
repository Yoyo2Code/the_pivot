class AddImageUrlToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :image_url, :text
  end
end
