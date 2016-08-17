class RenameTitleToCity < ActiveRecord::Migration[5.0]
  def change
    rename_column :locations, :title, :city
  end
end
