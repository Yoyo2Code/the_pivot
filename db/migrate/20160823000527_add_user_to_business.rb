class AddUserToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_reference :businesses, :user, foreign_key: true
  end
end
