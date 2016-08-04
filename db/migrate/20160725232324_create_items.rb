class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_path, default: "http://vignette4.wikia.nocookie.net/lego/images/6/63/New52Cyborg_Happy!.png/revision/latest?cb=20141224001316"
      t.integer :category_id

      t.timestamps
    end
  end
end
