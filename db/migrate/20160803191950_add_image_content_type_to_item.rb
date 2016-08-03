class AddImageContentTypeToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :image_content_type, :string
  end
end
