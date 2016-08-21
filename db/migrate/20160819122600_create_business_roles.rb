class CreateBusinessRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :business_roles do |t|
      t.references :business, foreign_key: true
      t.references :role, foreign_key: true
    end
  end
end
