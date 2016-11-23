class CreateKitchenPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :kitchen_photos do |t|
      t.text :image_url
      t.references :kitchen, foreign_key: true

      t.timestamps
    end
  end
end
