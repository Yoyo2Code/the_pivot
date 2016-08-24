class CreateDates < ActiveRecord::Migration[5.0]
  def change
    create_table :dates do |t|
      t.datetime :night
    end
  end
end
