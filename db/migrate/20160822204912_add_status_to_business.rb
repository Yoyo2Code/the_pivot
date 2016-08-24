class AddStatusToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :status, :integer, default: 0
  end
end
