class AddBusinessToProperties < ActiveRecord::Migration[5.0]
  def change
    add_reference :properties, :business, foreign_key: true
  end
end
